# Generated by Django 5.1.3 on 2025-01-02 13:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0003_work_is_approved'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='work',
            options={'ordering': ['-created_at']},
        ),
    ]
