# Generated by Django 5.0.6 on 2024-11-11 11:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('contest', '0002_contest_created_at_contest_is_private_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='contest',
            name='award_condition',
            field=models.CharField(choices=[('likes', 'No. of likes'), ('admin', 'To be decided by admin')], default='admin', help_text='Condition for awarding the contest winner', max_length=10),
        ),
        migrations.AddField(
            model_name='contest',
            name='eligibility_criteria',
            field=models.TextField(blank=True, help_text='Eligibility criteria for participants'),
        ),
    ]
