# Generated by Django 4.2.4 on 2023-08-21 15:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('listingIPApp', '0002_rename_ipadresses_ipaddresses'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ipaddresses',
            name='ip_address',
            field=models.GenericIPAddressField(unique=True),
        ),
    ]