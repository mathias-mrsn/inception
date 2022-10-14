FROM debian:buster

RUN apt-get update -y \
    && apt-get install -y wget \
    && apt-get install -y php7.3-fpm php7.3-common php7.3-mysql

EXPOSE 8000

RUN mkdir -p /etc/local/adminer
COPY ./bin/entrypoint.sh /etc/local/adminer/entrypoint.sh

ENTRYPOINT [ "/bin/bash", "/etc/local/adminer/entrypoint.sh" ]