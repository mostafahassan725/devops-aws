from django.shortcuts import render
from django.http import HttpResponse
from .models import IPAdresses

# This view is for adding client IP to RDS database (or sqlite3 in case of testing) and display a message.

def home(request):
    client_ip_address = request.META.get('REMOTE_ADDR')
    if client_ip_address:
        new_ip = IPAdresses.objects.create(client_ip_address,DataTime.now())
        new_ip.save()
        return HttpResponse("<h1>Your ip address had been added to the database successfully.</h1>")
    else:
        return HttpResponse("<h1>Your ip address could not be added to the database! maybe because your ip is private or there is a proxy.</h1>")
    
# This view is for showing all the IPs and date of visiting of clients

def show_ips(request):
    ips = IPAddresses.objects.all()
    return render(request, 'show_ips.html', {'ips': ips})
