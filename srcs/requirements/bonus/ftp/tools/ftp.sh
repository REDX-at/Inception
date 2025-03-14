#!/bin/bash

useradd -m -d /var/www/html -s /bin/bash "$FTP_USER" && echo "$FTP_USER:$FTP_PASS" | chpasswd

chown -R "$FTP_USER":"$FTP_USER" /var/www/html
chmod -R 755 /var/www/html

mkdir -p /var/run/vsftpd/empty

vsftpd /etc/vsftpd.conf
