FROM debian:buster

RUN apt-get -y update \
    && apt-get install -y php \
    && apt-get install -y mariadb-client

# EXPOSE 9000
# EXPOSE 3306 # not sure

RUN mkdir -p /etc/local/wp-configuration

COPY ./configuration/* /etc/local/wp-configuration
COPY ./bin/setup-wp.sh /etc/local/wp-configuration

# CMD ["/bin/sh", "/etc/local/wp-configuration/setup-wp.sh"]