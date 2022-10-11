FROM debian:buster

RUN apt-get -y update \ 
    && apt-get install -y php \
    && apt-get install -y mariadb-client \
    && apt-get install -y php-fpm \
    && apt-get install -y php-mysql \
    && apt-get install -y curl \
    && apt-get install -y procps

EXPOSE 9000

RUN mkdir -p /etc/local/wp-configuration

COPY ./configuration/* /etc/local/wp-configuration/
COPY ./bin/* /etc/local/wp-configuration/

WORKDIR /var/www/html

CMD ["/bin/sh", "/etc/local/wp-configuration/entrypoint.sh"]


# docker run -p 9000:9000 --net=net -d -v wordpress:/var/www/html -h="wordpress" -t wordpress