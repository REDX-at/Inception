#!/bin/bash

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "MariaDB is running successfully ..."

mysqld_safe --datadir='/var/lib/mysql'
