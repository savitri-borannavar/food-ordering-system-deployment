# Use the smallest possible PHP-Apache base image
FROM php:8.1-apache-slim

# Install only what's required (mysqli for MySQL)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install mysqli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite (for .htaccess support)
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy only the necessary files
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose the default Apache port
EXPOSE 80
