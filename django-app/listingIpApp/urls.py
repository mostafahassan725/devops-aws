from django.urls import path
from . import views
urlpatterns=[
   path('',views.home),
   path('showips',views.showips)
]
