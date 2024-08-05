# Use MySQL 8.0 image
FROM mysql:8.0

# Set environment variables for MySQL
ENV MYSQL_DATABASE=STOCK_DATA
ENV MYSQL_USER=nishant
ENV MYSQL_PASSWORD=Nishant@123
ENV MYSQL_ROOT_PASSWORD=Nishant@123

# Copy the database dump into the container
COPY stock_data.sql /docker-entrypoint-initdb.d/

# Expose the MySQL port
EXPOSE 3306


