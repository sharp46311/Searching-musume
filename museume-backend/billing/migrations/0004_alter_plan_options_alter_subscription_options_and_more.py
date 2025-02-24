# Generated by Django 5.0.6 on 2025-01-06 23:49

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('billing', '0003_rename_user_subscription_member_remove_plan_credits'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='plan',
            options={'verbose_name': 'Plan', 'verbose_name_plural': 'Plans'},
        ),
        migrations.AlterModelOptions(
            name='subscription',
            options={'verbose_name': 'Subscription', 'verbose_name_plural': 'Subscriptions'},
        ),
        migrations.AlterField(
            model_name='plan',
            name='amount',
            field=models.DecimalField(decimal_places=2, max_digits=10, verbose_name='amount'),
        ),
        migrations.AlterField(
            model_name='plan',
            name='currency',
            field=models.CharField(default='usd', max_length=3, verbose_name='currency'),
        ),
        migrations.AlterField(
            model_name='plan',
            name='features',
            field=models.TextField(help_text='Comma-separated list of features', verbose_name='features'),
        ),
        migrations.AlterField(
            model_name='plan',
            name='interval',
            field=models.CharField(choices=[('day', 'Day'), ('week', 'Week'), ('month', 'Month'), ('year', 'Year')], max_length=10, verbose_name='interval'),
        ),
        migrations.AlterField(
            model_name='plan',
            name='name',
            field=models.CharField(max_length=100, verbose_name='name'),
        ),
        migrations.AlterField(
            model_name='plan',
            name='stripe_price_id',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='subscription id'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='active',
            field=models.BooleanField(default=True, verbose_name='is active'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name='created at'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='member',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='member'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='plan',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='billing.plan', verbose_name='plan'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='stripe_customer_id',
            field=models.CharField(max_length=255, verbose_name='customer id'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='stripe_subscription_id',
            field=models.CharField(max_length=255, verbose_name='stripe subscription id'),
        ),
        migrations.AlterField(
            model_name='subscription',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, verbose_name='updated at'),
        ),
    ]
