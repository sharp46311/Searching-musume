# Generated by Django 5.0.6 on 2025-01-18 01:43

import django.contrib.auth.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0017_remove_organization_organization_type_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProfileMember',
            fields=[
            ],
            options={
                'verbose_name': 'ProfileMember',
                'verbose_name_plural': 'ProfileMembers',
                'proxy': True,
                'indexes': [],
                'constraints': [],
            },
            bases=('member.member',),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
    ]
