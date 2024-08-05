# api/urls.py

from django.urls import path
from . import views
from .views import csrf_token_view, custom_login, register, metrics_view

urlpatterns = [
    path('daily-closing-price/', views.daily_closing_price, name='daily_closing_price'),
    path('price-change-percentage/', views.price_change_percentage, name='price_change_percentage'),
    path('top-gainers-losers/', views.top_gainers_losers, name='top_gainers_losers'),
    path('stock-data/', views.stock_data, name='stock_data'),
    path('todays-data/', views.todays_data, name='todays_data'),
    path('csrf-token/', csrf_token_view, name='csrf_token'),
    path('login/', custom_login, name='custom_login'),
    path('register/', register, name='register'),
    path('metrics/', metrics_view, name='metrics'),  # Add this line
]
