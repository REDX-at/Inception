#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --path=/var/www/html --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL --path=/var/www/html --allow-root
wp user create $USER $MAIL --role=$ROLE --user_pass=$PASS --allow-root

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

wp plugin install redis-cache --activate --allow-root

wp config set WP_REDIS_HOST 'redis' --allow-root
wp config set WP_CACHE 'true' --allow-root
wp config set FS_METHOD 'direct' --allow-root
wp config set WP_REDIS_PORT '6379' --allow-root

wp redis enable --allow-root

chmod -R o+w /var/www/html/ 

php-fpm7.4 -F