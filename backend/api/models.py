from django.db import models

class Stock(models.Model):
    ticker = models.CharField(max_length=10)
    date = models.DateField()
    open = models.FloatField()
    high = models.FloatField()
    low = models.FloatField()
    close = models.FloatField()
    volume = models.BigIntegerField()

    class Meta:
        db_table = 'stocks'  # Correct table name
        indexes = [
            models.Index(fields=['ticker', 'date']),
        ]

    def __str__(self):
        return f"{self.ticker} - {self.date}"


class DailyClosingPrice(models.Model):
    ticker = models.CharField(max_length=10)
    date = models.DateField()
    close = models.FloatField()

    class Meta:
        db_table = 'daily_closing_price'
        indexes = [
            models.Index(fields=['ticker', 'date']),
        ]

    def __str__(self):
        return f"{self.ticker} - {self.date} - {self.close}"


class PriceChangePercentage(models.Model):
    ticker = models.CharField(max_length=10)
    date = models.DateField()
    change_period = models.CharField(max_length=20)
    percentage_change = models.FloatField()

    class Meta:
        db_table = 'price_change_percentage'
        indexes = [
            models.Index(fields=['ticker', 'date', 'change_period']),
        ]

    def __str__(self):
        return f"{self.ticker} - {self.date} - {self.change_period} - {self.percentage_change}"


class TopGainersLosers(models.Model):
    ticker = models.CharField(max_length=10)
    date = models.DateField()
    gainers_or_losers = models.CharField(max_length=10)
    percentage_change = models.FloatField()

    class Meta:
        db_table = 'top_gainers_losers'
        indexes = [
            models.Index(fields=['ticker', 'date', 'gainers_or_losers']),
        ]

    def __str__(self):
        return f"{self.ticker} - {self.date} - {self.gainers_or_losers} - {self.percentage_change}"


class TodaysData(models.Model):
    ticker = models.CharField(max_length=10)
    date = models.DateField()
    open = models.FloatField()
    high = models.FloatField()
    low = models.FloatField()
    close = models.FloatField()
    volume = models.BigIntegerField()

    class Meta:
        db_table = 'todays_data'
        indexes = [
            models.Index(fields=['ticker', 'date']),
        ]

    def __str__(self):
        return f"{self.ticker} - {self.date} - Open: {self.open}, High: {self.high}, Low: {self.low}, Close: {self.close}, Volume: {self.volume}"
