FROM php:8.1-apache

# Install MySQLi for PHP-MySQL interaction
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Enable Apache mod_rewrite (if needed by your .htaccess)
RUN a2enmod rewrite

# Copy your PHP source code into Apache web root
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80
