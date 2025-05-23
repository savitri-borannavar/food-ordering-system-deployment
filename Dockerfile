FROM php:8.1-apache-buster-slim

# Install MySQLi extension
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy only necessary project files
COPY . /var/www/html/

# Set correct ownership
RUN chown -R www-data:www-data /var/www/html/

# Expose port 80
EXPOSE 80
