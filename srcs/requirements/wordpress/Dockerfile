FROM debian:buster

RUN apt-get -y update \ 
    && apt-get install -y php \
    && apt-get install -y mariadb-client \
    && apt-get install -y php-fpm \
    && apt-get install -y php-mysql \
    && apt-get install -y curl \
    && apt-get install -y procps \
    && apt-get install -y lsb-release redis-server

RUN mkdir -p /etc/local/wp-configuration /var/www/html

COPY ./configuration/* /etc/local/wp-configuration/
COPY ./bin/* /etc/local/wp-configuration/

WORKDIR /var/www/html

ENTRYPOINT ["/bin/sh", "/etc/local/wp-configuration/entrypoint.sh"]
