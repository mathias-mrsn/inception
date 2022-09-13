FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install mariadb-server

COPY srcs/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY srcs/db_setup.sh /etc/mysql/db_setup.sh

EXPOSE 3306

CMD ["/bin/sh", "/etc/mysql/db_setup.sh"]