from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.conf import settings

def send_email(template_name, subject, context, recipient_email, from_email=settings.EMAIL_HOST_MAIL):
  try:
    print("receipnt email", recipient_email)
    context['mailto'] = settings.CONTACT_EMAIL
    html_message = render_to_string(template_name, context)
    plain_message = strip_tags(html_message)
    
    send_mail(
        subject=subject,
        message=plain_message,
        from_email=from_email,
        recipient_list=[recipient_email],
        html_message=html_message,
    )
    print(f"Email sent to {recipient_email} using {template_name}")
  except Exception as e:
    print(f"Failed to send email to {recipient_email}: {e}")
