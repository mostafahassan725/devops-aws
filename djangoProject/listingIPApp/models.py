from django.db import models

# Create your models here.

class IPAdresses(models.Model):
    ip_address = models.GenericIPAddressField()
    date_added = models.DateTimeField()
