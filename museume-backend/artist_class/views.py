from rest_framework import generics, status
from rest_framework.views import APIView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter
from django.views.decorators.csrf import csrf_exempt
from rest_framework.response import Response
from museum_app.permissions import IsChild
from .filters import ArtistClassFilter
from .models import ArtistClass, MemberClassSignup, Payment
from .serializers import ArtistClassSerializer, MemberClassSignupSerializer
from .pagination import CustomPageNumberPagination
from member.helpers.emails import send_email
from django.utils.translation import gettext as _
from django.http import HttpResponse
import os
import stripe
stripe.api_key = os.getenv('STRIPE_SECRET_KEY')



class ArtistClassListView(generics.ListAPIView):
    permission_classes = [IsChild]
    serializer_class = ArtistClassSerializer
    filter_backends = [DjangoFilterBackend, SearchFilter]
    filterset_class = ArtistClassFilter
    search_fields = ['name', 'category']
    pagination_class = CustomPageNumberPagination

    def get_queryset(self):
        user = self.request.user

        queryset = ArtistClass.objects.filter(
        )

        return queryset
    
class MyArtistClassListView(generics.ListAPIView):
   permission_classes = [IsChild]
   serializer_class = ArtistClassSerializer 
   filter_backends = [DjangoFilterBackend, SearchFilter]
   filterset_class = ArtistClassFilter
   search_fields = ['name', 'category']
   pagination_class = CustomPageNumberPagination

   def get_queryset(self):
       return ArtistClass.objects.filter(
           signups__member=self.request.user,
           signups__status='confirmed'
       )


class ArtistClassDetailView(generics.RetrieveAPIView):
    permission_classes = [IsChild]
    queryset = ArtistClass.objects.all()
    serializer_class = ArtistClassSerializer

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        data = serializer.data

        # Get member signup status for this class if it exists
        member_signup = MemberClassSignup.objects.filter(
            member=request.user,
            artist_class=instance,
            status='confirmed',
        ).first()

        # Add signup info to response
        data['member_signup'] = {
            'is_signed_up': member_signup is not None,
            'status': member_signup.status if member_signup else None,
            'signed_up_at': member_signup.signed_up_at if member_signup else None
        }
        if not member_signup:
            data['url'] = ''

        return Response(data)

class ClassSignupView(APIView):
    permission_classes = [IsChild]

    def post(self, request, *args, **kwargs):
        artist_class_id = request.data.get('artist_class')

        try:
            artist_class = ArtistClass.objects.get(id=artist_class_id)
            print("artist class:::::", artist_class)

            existing_signup = MemberClassSignup.objects.filter(member=request.user, artist_class_id=artist_class_id).first()
            if existing_signup:
                if existing_signup.status == 'pending':
                    return Response({"message": _("Payment is pending for this class.")}, status=status.HTTP_400_BAD_REQUEST)
                return Response({"message": _("You are already signed up for this class.")}, status=status.HTTP_400_BAD_REQUEST)
            
            # Check if the class is paid
            if not artist_class.is_free:

                if not artist_class.cost:
                    return Response({"message": _("Cannot sign up for this class as the cost is not specified.")}, status=status.HTTP_400_BAD_REQUEST)
                # Calculate the amount (example: convert to cents for Stripe)

                print("in not free artist class")
                amount = artist_class.cost  # Get the cost from the artist class

                # Create Stripe Payment Intent
                payment_intent = stripe.PaymentIntent.create(
                    amount=int(amount * 100),  # Amount in cents
                    currency="usd",
                    metadata={
                        "payment_type": "artist_class",
                        "artist_class_id": str(artist_class_id),  # Convert to string
                        "member_id": str(request.user.id),
                        "artist_class_name": artist_class.name
                    },
                    description=f"Payment for artist class: {artist_class.name}",
                )

                # Save payment in the database
                payment = Payment.objects.create(
                    member=request.user,
                    artist_class=artist_class,
                    stripe_payment_intent_id=payment_intent['id'],
                    amount=amount,
                    status='pending'  # Changed from 'succeeded' to 'pending'
                )
                print("payment created::::::::::", payment)

                # Create member signup in pending state
                MemberClassSignup.objects.create(
                    member=request.user,
                    artist_class=artist_class,
                    status='pending' #will be changed after hook started to work
                )

                return Response({
                    "payment_intent_client_secret": payment_intent['client_secret'],
                    "amount": amount, #
                    "message": _("Payment required. Complete payment to register for the class.")
                }, status=status.HTTP_200_OK)

            # If the class is free, sign up directly
            serializer = MemberClassSignupSerializer(data=request.data)
            if serializer.is_valid():
                signup = serializer.save(member=request.user, status='confirmed')
                response_data = {
                    "message": _("Successfully Signed up for the class"),
                    "data": serializer.data,
                }
                return Response(response_data, status=status.HTTP_201_CREATED)

            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        except ArtistClass.DoesNotExist:
            return Response({"errors": _("Class not found.")}, status=status.HTTP_404_NOT_FOUND)
        except stripe.error.StripeError as e:
            return Response({"errors": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        
@csrf_exempt
def ArtistClassWebhook(request):
    print("in artist class webhook")
    payload = request.body
    sig_header = request.META['HTTP_STRIPE_SIGNATURE']
    event = None
    stripe_webhook_secret = os.getenv('STRIPE_ARTIST_CLASS_WEBHOOK_SECRET')  

    try:
        event = stripe.Webhook.construct_event(
            payload, sig_header, stripe_webhook_secret,
        )
    except ValueError as e:
        print(f"Webhook Error: Invalid payload - {str(e)}")
        return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
    except stripe.error.SignatureVerificationError as e:
        print(f"Webhook Error: Invalid signature - {str(e)}")
        return HttpResponse(status=status.HTTP_400_BAD_REQUEST)

    print(f"ARTIST CLASS EVENT: {event['type']}, {event['id']}")
    
    try:
        if event['type'] == 'payment_intent.succeeded':
            payment_intent = event['data']['object']
            metadata = payment_intent.get('metadata', {})

            
            print(f"Processing payment_intent.succeeded for ID: {payment_intent['id']}")
            print(f"Metadata received: {metadata}")

            try:
                # Update payment status
                payment = Payment.objects.get(
                    stripe_payment_intent_id=payment_intent['id']
                )
                payment.status = 'succeeded'
                payment.save()
                print(f"Payment updated successfully: {payment.id}")

                # Update class signup status
                signup = MemberClassSignup.objects.get(
                    member_id=metadata['member_id'],
                    artist_class_id=metadata['artist_class_id']
                )
                signup.status = 'confirmed'
                signup.save()
                print(f"Signup updated successfully: {signup.id}")

                # Get artist class details
                artist_class = ArtistClass.objects.get(id=metadata['artist_class_id'])
                
                # Get frontend URL from environment
                frontend_url = os.getenv('FRONTEND_URL')
                
                # Send email with video URL
                context = {
                    'class_name': artist_class.name,
                    'course_link': f"{frontend_url}link-url?artistClassVideoUrl={artist_class.url}"
                }
                print("context:::", context)
                send_email(
                    template_name='emails/artist_class_url.html',
                    subject=f"Video Link for {artist_class.name}",
                    context=context,
                    recipient_email=signup.member.parent.email,
                )
                print(f"Video link email sent to {signup.member.parent.email}")
                
            except Payment.DoesNotExist:
                print(f"Payment not found for payment_intent_id: {payment_intent['id']}")
                return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
            except MemberClassSignup.DoesNotExist:
                print(f"Signup not found for member_id: {metadata['member_id']} and class_id: {metadata['artist_class_id']}")
                return HttpResponse(status=status.HTTP_400_BAD_REQUEST)
            except Exception as e:
                print(f"Error updating records: {str(e)}")
                return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return HttpResponse(status=status.HTTP_200_OK)
        
    except Exception as e:
        print(f"Webhook processing error: {str(e)}")
        print(f"Event data: {event}")
        return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class ClassRegistrationStatusView(APIView):
    permission_classes = [IsChild]

    def get(self, request, class_id):
        try:
            # Check if the class exists
            artist_class = ArtistClass.objects.get(id=class_id)
        except ArtistClass.DoesNotExist:
            return Response({"errors": _("Class not found.")}, status=status.HTTP_404_NOT_FOUND)

        # Check if the user is registered
        try:
            registration = MemberClassSignup.objects.get(member=request.user, artist_class=artist_class)
            response = {
                "registration_status": "registered",
                "payment_status": "paid" if registration.is_paid else "not_paid"
            }
            return Response(response, status=status.HTTP_200_OK)
        except MemberClassSignup.DoesNotExist:
            return Response({
                "registration_status": "not_registered",
                "payment_status": None
            }, status=status.HTTP_200_OK)
        
class VideoUrlView(APIView):
    permission_classes = [IsChild]

    def post(self, request, class_id):
        try:
            artist_class = ArtistClass.objects.get(id=class_id)
            
            # Check if the class is real-time
            # if artist_class.class_type not in ["real_time", "Real Time"]:
            #     return Response({"message": "This class is not a real-time class."}, status=status.HTTP_400_BAD_REQUEST)
            
            # Validate signup and payment status
            member_signup = MemberClassSignup.objects.filter(
                member=request.user, artist_class=artist_class
            ).first()
            
            if not member_signup:
                return Response({"message": _("You are not registered for this class.")}, status=status.HTTP_400_BAD_REQUEST)
            
            # Fetch email from user
            user_email = request.user.parent.email
            if not user_email:
                return Response({"message": _("User email is not available.")}, status=status.HTTP_400_BAD_REQUEST)

            context = {
                'user_name': request.user.username,
                'course_name': artist_class.name,
                'course_link': artist_class.url,
            }
            send_email(
                template_name="emails/artist_class_url.html",
                subject="Artist Class Invite Url",
                context=context,
                recipient_email=user_email,
            )

            return Response({"message": _("Video URL has been sent to your email."), "url": artist_class.url}, status=status.HTTP_200_OK)

        except ArtistClass.DoesNotExist:
            return Response({"errors": _("Class not found.")}, status=status.HTTP_404_NOT_FOUND)


# def stripe_webhook(request):
#     payload = request.body
#     sig_header = request.META['HTTP_STRIPE_SIGNATURE']
#     endpoint_secret = settings.STRIPE_ENDPOINT_SECRET  # Set in settings

#     try:
#         event = stripe.Webhook.construct_event(
#             payload, sig_header, endpoint_secret
#         )
#     except ValueError:
#         return JsonResponse({"error": "Invalid payload"}, status=400)
#     except stripe.error.SignatureVerificationError:
#         return JsonResponse({"error": "Invalid signature"}, status=400)

#     # Handle the event
#     if event['type'] == 'payment_intent.succeeded':
#         payment_intent = event['data']['object']
#         stripe_payment_id = payment_intent['id']

#         # Update payment record
#         try:
#             payment = Payment.objects.get(stripe_payment_intent_id=stripe_payment_id)
#             payment.status = 'succeeded'
#             payment.save()
#         except Payment.DoesNotExist:
#             pass

#     return JsonResponse({"status": "success"}, status=200)

# from rest_framework.views import APIView
# from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
# from rest_framework import status
# import stripe

class ConfirmPaymentView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        payment_intent_id = request.data.get('payment_intent_id')

        if not payment_intent_id:
            return Response({"errors": _("Payment Intent ID is required.")}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Fetch the Payment record
            payment = Payment.objects.get(stripe_payment_intent_id=payment_intent_id)

            # Verify payment status with Stripe
            payment_intent = stripe.PaymentIntent.retrieve(payment_intent_id)
            if payment_intent['status'] != 'succeeded':
                return Response({"errors": _("Payment has not succeeded yet.")}, status=status.HTTP_400_BAD_REQUEST)

            # Update Payment record
            payment.status = 'succeeded'
            payment.save()

            # Update MemberClassSignup record
            member_signup = MemberClassSignup.objects.filter(
                member=payment.member,
                artist_class=payment.artist_class,
                status='pending'
            ).first()

            if not member_signup:
                return Response({"errors": _("Pending signup not found.")}, status=status.HTTP_404_NOT_FOUND)

            member_signup.status = 'confirmed'
            member_signup.save()

            return Response({"message": _("Payment confirmed and class signup updated successfully.")}, status=status.HTTP_200_OK)

        except Payment.DoesNotExist:
            return Response({"errors": _("Payment record not found.")}, status=status.HTTP_404_NOT_FOUND)
        except stripe.error.StripeError as e:
            return Response({"errors": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        except Exception as e:
            return Response({"errors": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
