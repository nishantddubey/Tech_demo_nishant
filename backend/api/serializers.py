from rest_framework import serializers
from .models import DailyClosingPrice, PriceChangePercentage, TopGainersLosers, Stock, TodaysData

class DailyClosingPriceSerializer(serializers.ModelSerializer):
    class Meta:
        model = DailyClosingPrice
        fields = '__all__'

class PriceChangePercentageSerializer(serializers.ModelSerializer):
    class Meta:
        model = PriceChangePercentage
        fields = '__all__'

class TopGainersLosersSerializer(serializers.ModelSerializer):
    class Meta:
        model = TopGainersLosers
        fields = '__all__'

class StockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Stock
        fields = '__all__'

class TodaysDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = TodaysData
        fields = '__all__'
