from django.core.management.base import BaseCommand
from django.conf import settings
import yfinance as yf
from django.db import connection

class Command(BaseCommand):
    help = 'Fetch stock data and store it in the database'

    def handle(self, *args, **kwargs):
        tickers = [
            'AAPL', 'MSFT', 'GOOGL', 'AMZN', 'TSLA',
            'META', 'NVDA', 'NFLX', 'ADBE', 'INTC',
            'PYPL', 'CSCO', 'PEP', 'AVGO', 'COST',
            'TM', 'NKE', 'V', 'MA', 'JPM'
        ]

        def fetch_stock_data(tickers):
            stock_data = {}
            for ticker in tickers:
                stock = yf.Ticker(ticker)
                data = stock.history(period="1d", interval="1d")
                stock_data[ticker] = data
            return stock_data

        def create_stock_data_table(cursor):
            create_table_query = """
            CREATE TABLE IF NOT EXISTS stocks (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ticker VARCHAR(10),
                date DATE,
                open FLOAT,
                high FLOAT,
                low FLOAT,
                close FLOAT,
                volume BIGINT
            )
            """
            try:
                cursor.execute(create_table_query)
            except Exception as err:
                self.stderr.write(f"Failed creating table: {err}")
                return False
            return True

        def insert_stock_data(cursor, stock_data):
            insert_query = """
            INSERT INTO stocks (ticker, date, open, high, low, close, volume)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            delete_query = "DELETE FROM stocks WHERE date = %s AND ticker = %s"

            for ticker, data in stock_data.items():
                for date, row in data.iterrows():
                    # Delete existing data for the same date and ticker
                    cursor.execute(delete_query, (date, ticker))

                    # Insert new data
                    cursor.execute(insert_query, (
                        ticker,
                        date,
                        row['Open'],
                        row['High'],
                        row['Low'],
                        row['Close'],
                        row['Volume']
                    ))

        stock_data = fetch_stock_data(tickers)

        # Use Django's database connection
        with connection.cursor() as cursor:
            if create_stock_data_table(cursor):
                insert_stock_data(cursor, stock_data)
                connection.commit()
