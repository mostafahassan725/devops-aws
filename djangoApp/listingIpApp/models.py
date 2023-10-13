from django.db import models

# IP addresses database in RDS (or sqlite3 in case of testing)

class IPAddresses(models.Model):
    ip_address = models.GenericIPAddressField(unique=True)
    date_added = models.DateTimeField(auto_now_add=True)
    #class Meta:
    #    unique_together = ["ip_address","date_added"]
