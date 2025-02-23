#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$(cat /run/secrets/db_password) --dbhost=$DB_HOST --path=/var/www/html --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$(cat /run/secrets/wp_password) --admin_email=$WP_EMAIL --path=/var/www/html --allow-root
wp user create $USER $MAIL --role=$ROLE --user_pass=$(cat /run/secrets/user_password) --allow-root


php-fpm7.4 -F