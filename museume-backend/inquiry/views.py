from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from member.helpers.emails import send_email
from django.conf import settings
from .serializers import InquirySerializer
from django.utils.translation import gettext as _

class InquiryAPIView(APIView):
    def post(self, request, *args, **kwargs):
        serializer = InquirySerializer(data=request.data)
        if serializer.is_valid():
            inquiry = serializer.save()

            if request.user and request.user.is_authenticated:
                inquiry.user_name = request.user.first_name
                inquiry.user_email = request.user.email
                inquiry.save()
            elif request.data.get('user_name') and request.data.get('user_email'):
                inquiry.user_name = request.data['user_name']
                inquiry.user_email = request.data['user_email']
            else:
                return Response({"errors": _("Please provide user name and email.")}, status=status.HTTP_400_BAD_REQUEST)
            # Send email to superadmin
            context = {
                'full_name': inquiry.user_name,
                'email': inquiry.user_email,
                'subject': inquiry.subject,
                'message': inquiry.inquiry_message,
            }
            send_email(
                template_name='emails/inquiry_email.html',
                subject=inquiry.subject,
                context=context,
                recipient_email=settings.ADMIN_EMAIL,
            )

            return Response({"message": _("Your Inquiry is submitted successfully.")}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
