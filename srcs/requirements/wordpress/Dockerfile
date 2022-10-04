FROM debian:buster

RUN apt-get -y update \
    && apt-get install -y php \
    && apt-get install -y mariadb-client \
    && apt-get install -y php5-fpm \
    && apt-get install -y php5-mcrypt \
    && apt-get install -y php5-curl \
    && apt-get install -y php5-gd \
    && apt-get install -y curl

EXPOSE 9000

RUN mkdir -p /etc/local/wp-configuration

COPY ./configuration/* /etc/local/wp-configuration
COPY ./bin/setup-wp.sh /etc/local/wp-configuration

CMD ["/bin/sh", "/etc/local/wp-configuration/setup-wp.sh"]