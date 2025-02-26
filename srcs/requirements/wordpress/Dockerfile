FROM debian:11

RUN apt-get update && apt-get install -y \
    wget \
    php7.4-fpm \
    php7.4-mysqli \
    php7.4-xml \
    curl \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html /run/php

RUN chown -R www-data:www-data /var/www/html

COPY custom-www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./tools/wp.sh .

RUN chmod +x wp.sh

CMD ["./wp.sh"]
