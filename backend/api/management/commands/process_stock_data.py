from django.core.management.base import BaseCommand
from django.db import connection
import pandas as pd
from datetime import datetime

# Fetch data from the database using Django's database connection
def fetch_data_from_db():
    """Fetch stock data from the MySQL database."""
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM stocks")
        rows = cursor.fetchall()
        columns = [col[0] for col in cursor.description]
        df = pd.DataFrame(rows, columns=columns)
    return df

def calculate_kpis(data):
    """Calculate Key Performance Indicators (KPIs) from stock data."""
    kpis = {}
    # Convert all column names to lowercase
    data.columns = [col.lower() for col in data.columns]

    # Ensure columns are present
    required_columns = ['ticker', 'date', 'open', 'high', 'low', 'close', 'volume']
    for col in required_columns:
        if col not in data.columns:
            raise KeyError(f"Missing column: {col}")

    # Daily Closing Price KPI (only the latest day)
    data['date'] = pd.to_datetime(data['date'])
    latest_date = data['date'].max()
    latest_day_data = data[data['date'] == latest_date]

    kpis['Daily_Closing_Price'] = latest_day_data[['ticker', 'date', 'close']]
    kpis['Todays_Data'] = latest_day_data

    # Price Change Percentage KPI
    def calculate_change(df):
        changes = {'ticker': df['ticker'].iloc[0]}
        num_days = len(df)

        if num_days >= 2:
            changes['24_hours'] = (df['close'].pct_change().iloc[-1] * 100) if num_days > 1 else None
            if num_days >= 30:
                changes['30_days'] = ((df['close'].iloc[-1] - df['close'].iloc[-30]) / df['close'].iloc[-30] * 100)
            else:
                changes['30_days'] = ((df['close'].iloc[-1] - df['close'].iloc[0]) / df['close'].iloc[0] * 100) if num_days > 1 else None
            
            if num_days >= 252:
                changes['1_year'] = ((df['close'].iloc[-1] - df['close'].iloc[-252]) / df['close'].iloc[-252] * 100)
            else:
                changes['1_year'] = ((df['close'].iloc[-1] - df['close'].iloc[0]) / df['close'].iloc[0] * 100) if num_days > 1 else None
        else:
            changes.update({'24_hours': None, '30_days': None, '1_year': None})
        return pd.Series(changes)

    grouped = data.groupby('ticker', group_keys=False)
    price_change = grouped.apply(calculate_change).reset_index(drop=True)
    
    # Melting the DataFrame
    price_change = pd.melt(price_change, id_vars=['ticker'], value_vars=['24_hours', '30_days', '1_year'])
    price_change.columns = ['ticker', 'change_period', 'percentage_change']
    kpis['Price_Change_Percentage'] = price_change

    # Top Gainers/Losers KPI
    daily_changes = data.groupby('ticker').apply(lambda df: (df['close'].iloc[-1] - df['close'].iloc[0]) / df['close'].iloc[0] * 100).reset_index()
    daily_changes.columns = ['ticker', 'percentage_change']
    daily_changes = daily_changes.sort_values(by='percentage_change', ascending=False)
    kpis['Top_Gainers'] = daily_changes.head(5)
    kpis['Top_Losers'] = daily_changes.tail(5)

    return kpis

def store_kpis_to_db(kpis):
    """Store KPIs in the database using Django's ORM."""
    with connection.cursor() as cursor:
        # Create tables if they do not exist
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS daily_closing_price (
            id INT AUTO_INCREMENT PRIMARY KEY,
            ticker VARCHAR(10),
            date DATE,
            close FLOAT
        )
        """)
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS price_change_percentage (
            id INT AUTO_INCREMENT PRIMARY KEY,
            ticker VARCHAR(10),
            date DATE,
            change_period ENUM('24_hours', '30_days', '1_year'),
            percentage_change FLOAT
        )
        """)
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS top_gainers_losers (
            id INT AUTO_INCREMENT PRIMARY KEY,
            ticker VARCHAR(10),
            date DATE,
            gainers_or_losers ENUM('Gainers', 'Losers'),
            percentage_change FLOAT
        )
        """)
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS todays_data (
            id INT AUTO_INCREMENT PRIMARY KEY,
            ticker VARCHAR(10),
            date DATE,
            open FLOAT,
            high FLOAT,
            low FLOAT,
            close FLOAT,
            volume INT
        )
        """)

        # Get today's date
        today = datetime.now().date()

        # Clear existing records
        cursor.execute("DELETE FROM daily_closing_price")
        cursor.execute("DELETE FROM price_change_percentage")
        cursor.execute("DELETE FROM top_gainers_losers")
        cursor.execute("DELETE FROM todays_data")

        # Insert most recent data into daily_closing_price
        insert_query = """
        INSERT INTO daily_closing_price (ticker, date, close)
        VALUES (%s, %s, %s)
        """
        latest_day_data = kpis['Daily_Closing_Price']
        for _, row in latest_day_data.iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                row['date'],
                row['close']
            ))

        # Insert price change percentage data
        insert_query = """
        INSERT INTO price_change_percentage (ticker, date, change_period, percentage_change)
        VALUES (%s, %s, %s, %s)
        """
        for _, row in kpis['Price_Change_Percentage'].iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                today,
                row['change_period'],
                row['percentage_change']
            ))

        # Insert top gainers data
        insert_query = """
        INSERT INTO top_gainers_losers (ticker, date, gainers_or_losers, percentage_change)
        VALUES (%s, %s, %s, %s)
        """
        for _, row in kpis['Top_Gainers'].iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                today,
                'Gainers',
                row['percentage_change']
            ))
        
        # Insert top losers data
        for _, row in kpis['Top_Losers'].iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                today,
                'Losers',
                row['percentage_change']
            ))

        # Insert today's data
        insert_query = """
        INSERT INTO todays_data (ticker, date, open, high, low, close, volume)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        todays_data = kpis['Todays_Data']
        for _, row in todays_data.iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                row['date'],
                row['open'],
                row['high'],
                row['low'],
                row['close'],
                row['volume']
            ))

        connection.commit()

class Command(BaseCommand):
    help = 'Process stock data and calculate KPIs'

    def handle(self, *args, **kwargs):
        """Main function to fetch data, calculate KPIs, and store them."""
        stock_data = fetch_data_from_db()
        
        if stock_data is not None:
            kpis = calculate_kpis(stock_data)
            store_kpis_to_db(kpis)
