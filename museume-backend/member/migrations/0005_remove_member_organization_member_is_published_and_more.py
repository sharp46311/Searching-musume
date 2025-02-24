# Generated by Django 5.0.6 on 2024-11-05 15:07

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0004_member_address'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='member',
            name='organization',
        ),
        migrations.AddField(
            model_name='member',
            name='is_published',
            field=models.BooleanField(default=False, help_text='Is the member published?'),
        ),
        migrations.AddField(
            model_name='member',
            name='organizations',
            field=models.ManyToManyField(blank=True, related_name='members', to='member.organization'),
        ),
        migrations.AddField(
            model_name='member',
            name='shared_users',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='shared_members', to=settings.AUTH_USER_MODEL),
        ),
    ]
