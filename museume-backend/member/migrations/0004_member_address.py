# Generated by Django 5.0.6 on 2024-10-17 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0003_remove_member_admin_role_remove_member_is_verified_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='member',
            name='address',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
