FROM debian:11

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    php7.4-fpm \
    php7.4-mysqli \
    php7.4-xml \
    php7.4-curl \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /var/www/html /run/php

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm -rf wordpress latest.tar.gz

# Set permissions (important for WordPress)
RUN chown -R www-data:www-data /var/www/html

# Copy custom PHP-FPM configuration
COPY custom-www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM process
CMD ["php-fpm7.4", "-F"]
