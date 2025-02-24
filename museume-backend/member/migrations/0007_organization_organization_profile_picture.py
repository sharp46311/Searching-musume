# Generated by Django 5.0.6 on 2024-11-11 11:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0006_remove_member_shared_users_member_shared_users'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='organization_profile_picture',
            field=models.ImageField(blank=True, help_text='Profile picture of the organization', null=True, upload_to='profile_pictures/'),
        ),
    ]
