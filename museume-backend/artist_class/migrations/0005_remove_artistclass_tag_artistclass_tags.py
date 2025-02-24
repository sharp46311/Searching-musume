# Generated by Django 5.1.3 on 2024-12-01 15:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('artist_class', '0004_memberclasssignup_attended_and_more'),
        ('work', '0002_remove_work_likes_like'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='artistclass',
            name='tag',
        ),
        migrations.AddField(
            model_name='artistclass',
            name='tags',
            field=models.ManyToManyField(blank=True, related_name='artist_classes', to='work.tag'),
        ),
    ]
