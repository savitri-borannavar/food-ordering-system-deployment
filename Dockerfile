# Start from official PHP Apache image
FROM php:8.1-apache

# Install only what's required — here, mysqli
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite (useful for .htaccess)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy your project files into the container
COPY . /var/www/html

# Set appropriate permissions
RUN chown -R www-data:www-data /var/www/html

# Clean unnecessary files to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose default Apache port
EXPOSE 80
