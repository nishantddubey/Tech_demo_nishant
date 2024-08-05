from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import DailyClosingPrice, PriceChangePercentage, TopGainersLosers, Stock, TodaysData
from .serializers import DailyClosingPriceSerializer, PriceChangePercentageSerializer, TopGainersLosersSerializer, StockSerializer, TodaysDataSerializer
from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from rest_framework import status
from django.middleware.csrf import get_token
from django.contrib.auth.models import User
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from prometheus_client import Gauge, generate_latest
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

@api_view(['GET'])
def daily_closing_price(request):
    data = DailyClosingPrice.objects.all()
    serializer = DailyClosingPriceSerializer(data, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def price_change_percentage(request):
    data = PriceChangePercentage.objects.all()
    serializer = PriceChangePercentageSerializer(data, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def top_gainers_losers(request):
    data = TopGainersLosers.objects.all()
    serializer = TopGainersLosersSerializer(data, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def stock_data(request):
    data = Stock.objects.all()
    serializer = StockSerializer(data, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def todays_data(request):
    data = TodaysData.objects.all()
    serializer = TodaysDataSerializer(data, many=True)
    return Response(serializer.data)


def csrf_token_view(request):
    csrf_token = get_token(request)
    return JsonResponse({'csrfToken': csrf_token})


@api_view(['POST'])
def custom_login(request):
    username = request.data.get('username')
    password = request.data.get('password')
    
    user = authenticate(username=username, password=password)
    if user is not None:
        login(request, user)
        return JsonResponse({'message': 'Login successful'}, status=status.HTTP_200_OK)
    return JsonResponse({'error': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)



@api_view(['POST'])
def register(request):
    username = request.data.get('username')
    password = request.data.get('password')
    confirm_password = request.data.get('confirm_password')

    if password != confirm_password:
        return Response({'error': 'Passwords do not match'}, status=status.HTTP_400_BAD_REQUEST)

    try:
        validate_password(password)
    except ValidationError as e:
        return Response({'error': e.messages}, status=status.HTTP_400_BAD_REQUEST)

    if User.objects.filter(username=username).exists():
        return Response({'error': 'Username already exists'}, status=status.HTTP_400_BAD_REQUEST)

    user = User.objects.create_user(username=username, password=password)
    return Response({'message': 'User registered successfully'}, status=status.HTTP_201_CREATED)


# Define your Prometheus metrics
stock_count_gauge = Gauge('stock_count', 'Number of stock records')
daily_closing_price_gauge = Gauge('daily_closing_price', 'Daily closing price', ['ticker', 'date'])
price_change_percentage_gauge = Gauge('price_change_percentage', 'Percentage change in stock prices', ['ticker', 'change_period'])
top_gainers_losers_gauge = Gauge('top_gainers_losers', 'Top gainers and losers', ['ticker', 'gainers_or_losers'])
todays_data_gauge = Gauge('todays_data', 'Today\'s data', ['ticker', 'metric'])

@csrf_exempt
def metrics_view(request):
    # Update stock count metric
    stock_count = Stock.objects.count()
    stock_count_gauge.set(stock_count)

    # Update daily closing price metrics
    daily_closing_prices = DailyClosingPrice.objects.all()
    for record in daily_closing_prices:
        daily_closing_price_gauge.labels(ticker=record.ticker, date=str(record.date)).set(record.close)

    # Update price change percentage metrics
    price_changes = PriceChangePercentage.objects.all()
    for price_change in price_changes:
        price_change_percentage_gauge.labels(
            ticker=price_change.ticker,
            change_period=price_change.change_period
        ).set(price_change.percentage_change)

    # Update top gainers and losers metrics
    top_gainers_losers = TopGainersLosers.objects.all()
    for record in top_gainers_losers:
        top_gainers_losers_gauge.labels(
            ticker=record.ticker,
            gainers_or_losers=record.gainers_or_losers
        ).set(record.percentage_change)

    # Update today's data metrics
    todays_data = TodaysData.objects.all()
    for record in todays_data:
        todays_data_gauge.labels(ticker=record.ticker, metric='open').set(record.open)
        todays_data_gauge.labels(ticker=record.ticker, metric='high').set(record.high)
        todays_data_gauge.labels(ticker=record.ticker, metric='low').set(record.low)
        todays_data_gauge.labels(ticker=record.ticker, metric='close').set(record.close)
        todays_data_gauge.labels(ticker=record.ticker, metric='volume').set(record.volume)

    # Generate the metrics in Prometheus format
    return HttpResponse(generate_latest(), content_type='text/plain; version=0.0.4; charset=utf-8')
