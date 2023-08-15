from django.shortcuts import render
from .models import IPAdresses  

def add_ip_address(request):
    client_ip_address = request.META.get('REMOTE_ADDR')
    if client_ip_address:
        new_ip = IPAdresses.objects.create('','')
        new_ip.save
    else:


# Create your views here.
