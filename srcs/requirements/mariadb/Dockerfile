FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install mariadb-server \
	&& apt-get -y install mariadb-client \
	&& apt-get -y install vim \
	&& apt-get -y install procps

COPY configuration/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY bin/setup_db.sh /usr/local/bin/setup_db.sh
COPY bin/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/bin/bash", "/usr/local/bin/entrypoint.sh"]

# Create var $MARIADB_BIN_PATH

# docker run -p 3306:3306 --net=net -d -v mariadb_volume:/var/lib/mysql/ -h="mariadb" -t mariadb