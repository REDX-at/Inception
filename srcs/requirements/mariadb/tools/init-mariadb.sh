#!/bin/bash

# service mariadb start

# mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
# mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
# mariadb -e "FLUSH PRIVILEGES;"

# service mariadb stop

# echo "MariaDB is running successfully ..."

# mysqld_safe --datadir='/var/lib/mysql'

service mariadb start

sleep 5

mysql -u root --skip-password -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u root --skip-password -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${ROOT_PASS}';"
mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';"
mysql -u root --skip-password -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$ROOT_PASS shutdown

service mariadb stop

exec mysqld_safe --bind-address=0.0.0.0