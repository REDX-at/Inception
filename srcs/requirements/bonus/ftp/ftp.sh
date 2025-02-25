#!/bin/bash

useradd -m -d /var/www/html -s /bin/bash ftpuser && echo "ftpuser:pass" | chpasswd

chown -R ftpuser:ftpuser /var/www/html
chmod -R 755 /var/www/html

mkdir -p /var/run/vsftpd/empty

vsftpd /etc/vsftpd.conf