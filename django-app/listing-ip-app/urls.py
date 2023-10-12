from django.urls import path
from . import views
urlpatterns=[
   path('',views.home),
   path('showip/',views.show_ips)
]
