from django.core.management.base import BaseCommand
from django.db import connection
import pandas as pd
from datetime import datetime

# Function to fetch stock data from the database
def fetch_data_from_db():
    """Fetch stock data from the MySQL database."""
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM stocks")
        rows = cursor.fetchall()  # Fetch all rows from the query result
        columns = [col[0] for col in cursor.description]  # Extract column names from cursor description
        df = pd.DataFrame(rows, columns=columns)  # Create a DataFrame using the fetched data and column names
    return df

# Function to calculate price changes over different periods
def calculate_change(df):
    """Calculate price change percentages over 24 hours, 30 days, and 1 year."""
    changes = {'ticker': df['ticker'].iloc[0]}
    num_days = len(df)  # Get the number of days in the data

    if num_days >= 2:
        # Calculate the 24-hour percentage change
        changes['24_hours'] = (df['close'].pct_change().iloc[-1] * 100) if num_days > 1 else None
        
        # Calculate the 30-day percentage change
        if num_days >= 30:
            changes['30_days'] = ((df['close'].iloc[-1] - df['close'].iloc[-30]) / df['close'].iloc[-30] * 100)
        else:
            changes['30_days'] = ((df['close'].iloc[-1] - df['close'].iloc[0]) / df['close'].iloc[0] * 100) if num_days > 1 else None
        
        # Calculate the 1-year percentage change
        if num_days >= 252:  # Assuming 252 trading days in a year
            changes['1_year'] = ((df['close'].iloc[-1] - df['close'].iloc[-252]) / df['close'].iloc[-252] * 100)
        else:
            changes['1_year'] = ((df['close'].iloc[-1] - df['close'].iloc[0]) / df['close'].iloc[0] * 100) if num_days > 1 else None
    else:
        # If there are fewer than 2 days of data, set changes to None
        changes.update({'24_hours': None, '30_days': None, '1_year': None})
    return pd.Series(changes)

# Function to calculate Key Performance Indicators (KPIs) from stock data
def calculate_kpis(data):
    """Calculate Key Performance Indicators (KPIs) from stock data."""
    kpis = {}
    data.columns = [col.lower() for col in data.columns]  # Normalize column names to lowercase

    required_columns = ['ticker', 'date', 'open', 'high', 'low', 'close', 'volume']
    # Check for missing columns in the data
    for col in required_columns:
        if col not in data.columns:
            raise KeyError(f"Missing column: {col}")

    data['date'] = pd.to_datetime(data['date'])  # Convert 'date' column to datetime format
    latest_date = data['date'].max()  # Get the latest date in the data
    latest_day_data = data[data['date'] == latest_date]  # Filter data for the latest date

    # Store daily closing prices
    kpis['Daily_Closing_Price'] = latest_day_data[['ticker', 'date', 'close']]
    kpis['Todays_Data'] = latest_day_data

    # Group data by ticker and apply the price change calculation
    grouped = data.groupby('ticker', group_keys=False)
    price_change = grouped.apply(calculate_change).reset_index(drop=True)
    kpis['Price_Change_Percentage'] = price_change

    # Filter out NaN values and sort by percentage change to identify top gainers and losers
    valid_changes = price_change.dropna(subset=['24_hours']).sort_values(by='24_hours', ascending=False)
    kpis['Top_Gainers'] = valid_changes.head(5)
    kpis['Top_Losers'] = valid_changes.tail(5)

    return kpis

# Function to store KPIs in the database
def store_kpis_to_db(kpis):
    """Store KPIs in the database using Django's ORM."""
    with connection.cursor() as cursor:
        # Create tables to store KPI data if they do not already exist
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

        today = datetime.now().date()  # Get today's date

        # Clear existing data from the KPI tables
        cursor.execute("DELETE FROM daily_closing_price")
        cursor.execute("DELETE FROM price_change_percentage")
        cursor.execute("DELETE FROM top_gainers_losers")
        cursor.execute("DELETE FROM todays_data")

        # Insert daily closing price data
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

        # Insert price change percentage data for 24 hours, 30 days, and 1 year
        insert_query = """
        INSERT INTO price_change_percentage (ticker, date, change_period, percentage_change)
        VALUES (%s, %s, %s, %s)
        """
        for _, row in kpis['Price_Change_Percentage'].iterrows():
            if row['24_hours'] is not None:
                cursor.execute(insert_query, (
                    row['ticker'],
                    today,
                    '24_hours',
                    row['24_hours']
                ))
            if row['30_days'] is not None:
                cursor.execute(insert_query, (
                    row['ticker'],
                    today,
                    '30_days',
                    row['30_days']
                ))
            if row['1_year'] is not None:
                cursor.execute(insert_query, (
                    row['ticker'],
                    today,
                    '1_year',
                    row['1_year']
                ))

        # Insert top gainers and losers data
        insert_query = """
        INSERT INTO top_gainers_losers (ticker, date, gainers_or_losers, percentage_change)
        VALUES (%s, %s, %s, %s)
        """
        for _, row in kpis['Top_Gainers'].iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                today,
                'Gainers',
                row['24_hours']
            ))
        
        for _, row in kpis['Top_Losers'].iterrows():
            cursor.execute(insert_query, (
                row['ticker'],
                today,
                'Losers',
                row['24_hours']
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

        connection.commit()  # Commit the transaction to save changes to the database

class Command(BaseCommand):
    help = 'Process stock data and calculate KPIs'

    def handle(self, *args, **kwargs):
        """Main function to fetch data, calculate KPIs, and store them."""
        stock_data = fetch_data_from_db()  # Fetch stock data from the database
        if stock_data is not None:
            kpis = calculate_kpis(stock_data)  # Calculate KPIs from the stock data
            store_kpis_to_db(kpis)  # Store KPIs in the database
