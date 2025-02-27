#!/bin/bash

mkdir -p /var/www/html

wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php 

chmod +x /var/www/html/adminer.php

php -S 0.0.0.0:8080 -t /var/www/html
