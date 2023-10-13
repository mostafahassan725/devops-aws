# This view is for adding client IP to RDS database (or sqlite3 in case of testing) and display a message.

from django.db import IntegrityError
from django.shortcuts import render
from .models import IPAddresses

def home(request):
    try:
        client_ip_address = request.META.get('REMOTE_ADDR')
        IPAddresses.objects.create(ip_address=client_ip_address)
        return render(request, 'homesuccess.html')
    except IntegrityError:
        return render(request, 'homefailure.html')
    
# This view is for showing all the IPs and date of visiting of clients

def showips(request):
    ips = IPAddresses.objects.all()
    return render(request, 'showips.html', {'ips': ips})
