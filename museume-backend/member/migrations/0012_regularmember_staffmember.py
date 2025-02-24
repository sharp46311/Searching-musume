# Generated by Django 5.0.6 on 2024-12-23 17:10

import django.contrib.auth.models
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0011_organization_email_organization_staff_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='RegularMember',
            fields=[
            ],
            options={
                'verbose_name': 'Member',
                'verbose_name_plural': 'Members',
                'proxy': True,
                'indexes': [],
                'constraints': [],
            },
            bases=('member.member',),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='StaffMember',
            fields=[
            ],
            options={
                'verbose_name': 'Staff',
                'verbose_name_plural': 'Staff',
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
