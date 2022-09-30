FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install mariadb-server \
	&& apt-get -y install vim \
	&& apt-get -y install procps

COPY configuration/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY bin/setup_db.sh /usr/local/bin/setup_db.sh
COPY bin/entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 3306

CMD ["/bin/bash", "/usr/local/bin/entrypoint.sh"]

# Create var $MARIADB_BIN_PATH