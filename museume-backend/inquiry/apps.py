from django.utils.translation import gettext_lazy as _
from django.apps import AppConfig


class InquiryConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'inquiry'
    verbose_name = _("inquiry")