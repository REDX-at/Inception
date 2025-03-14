FROM debian:11

RUN apt-get update && apt-get install -y mariadb-client mariadb-server &&  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY ./tools/init-mariadb.sh .

RUN chmod +x init-mariadb.sh

EXPOSE 3306

CMD ["bash" , "init-mariadb.sh"]
