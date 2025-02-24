# Generated by Django 5.0.6 on 2024-11-06 13:28

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0005_remove_member_organization_member_is_published_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='member',
            name='shared_users',
        ),
        migrations.AddField(
            model_name='member',
            name='shared_users',
            field=models.ManyToManyField(blank=True, related_name='shared_members', to=settings.AUTH_USER_MODEL),
        ),
    ]
