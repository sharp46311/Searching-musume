# Generated by Django 5.0.6 on 2024-12-23 20:49

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0012_regularmember_staffmember'),
    ]

    operations = [
        migrations.AddField(
            model_name='member',
            name='branch',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='member.organizationbranch'),
        ),
    ]
