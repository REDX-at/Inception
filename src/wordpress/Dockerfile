FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y php php-fpm wget tar && \
    rm -rf /var/lib/apt/lists/*

# Ensure the /var/www/html directory exists
RUN mkdir -p /var/www/html

# Download and move WordPress files
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress/* /var/www/html && \
    rm -rf wordpress

EXPOSE 9000

# Start php-fpm with the full path
CMD ["/usr/sbin/php-fpm7.4", "-F"]
