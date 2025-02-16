FROM debian:11

# Install required packages (wget and php-fpm)
RUN apt-get update && apt-get install -y \
    wget \
    php-fpm \
    php-mysqli \
    php-xml \
    php-curl \
    && rm -rf /var/lib/apt/lists/*

# Create the necessary directories
RUN mkdir -p /var/www/html
RUN mkdir -p /run/php

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm -rf wordpress latest.tar.gz

# Configure php-fpm to listen on port 9000
RUN echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf

# Expose port 9000 for php-fpm
EXPOSE 9000

# Start PHP-FPM process
CMD ["php-fpm7.4", "-F"]
