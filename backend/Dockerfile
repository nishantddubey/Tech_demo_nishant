# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies needed for Python packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    pkg-config \
    cron \
    default-libmysqlclient-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Add the cron job for fetching and processing stock data every 2 minutes
RUN echo "*/2 * * * * cd /app && /usr/local/bin/python manage.py fetch_stock_data && sleep 30 && /usr/local/bin/python manage.py process_stock_data >> /var/log/cron.log 2>&1" > /etc/cron.d/stock_data_cron \
    && chmod 0644 /etc/cron.d/stock_data_cron \
    && crontab /etc/cron.d/stock_data_cron

# Give execution rights on the cron job
RUN chmod +x /etc/cron.d/stock_data_cron

# Make migrations and start the Django server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
