from django.db import models

# IP addresses database in RDS (or sqlite in case of testing)

class IPAdresses(models.Model):
    ip_address = models.GenericIPAddressField()
    date_added = models.DateTimeField()
