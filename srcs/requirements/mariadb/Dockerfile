FROM debian:11

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-client mariadb-server &&  rm -rf /var/lib/apt/lists/*

# Create MariaDB data directory
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Set up MariaDB configuration (optional: custom my.cnf)
COPY my.cnf /etc/mysql/my.cnf

COPY ./tools/init-mariadb.sh .

# run The script to initialize the database
RUN chmod +x init-mariadb.sh

# Expose MySQL port
EXPOSE 3306

# Start MariaDB
CMD ["/init-mariadb.sh"]
