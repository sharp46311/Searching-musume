# Generated by Django 5.0.6 on 2024-11-11 16:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0007_organization_organization_profile_picture'),
    ]

    operations = [
        migrations.RenameField(
            model_name='organization',
            old_name='organization_profile_picture',
            new_name='organization_icon',
        ),
    ]
