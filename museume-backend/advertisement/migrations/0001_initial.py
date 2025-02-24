# Generated by Django 5.1.3 on 2024-12-18 09:17

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Advertisement',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Name of the advertisement plan', max_length=100)),
                ('banner_frame', models.CharField(choices=[('fixed', 'Fixed')], default='fixed', help_text='Banner frame type', max_length=50)),
                ('banner_image', models.ImageField(help_text='Upload the banner image', upload_to='advertisements/')),
                ('start_date', models.DateTimeField(help_text='Start date of the display period')),
                ('end_date', models.DateTimeField(help_text='End date of the display period')),
            ],
        ),
    ]
