# Generated by Django 5.0.6 on 2024-12-27 13:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contest', '0007_contest_winner'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='contest',
            name='branch',
        ),
    ]
