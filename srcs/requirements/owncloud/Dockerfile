FROM debian:buster

RUN apt-get -y update && \
    apt-get install -y \
    apache2 \
    libapache2-mod-php \
    openssl \
    php-imagick \
    php-common \
    php-curl \
    php-gd \
    php-imap \
    php-intl \
    php-json \
    php-mbstring \
    php-mysql \
    php-ssh2 \
    php-xml \
    php-zip \
    php-apcu \
    php-redis \
    redis-server \
    wget

EXPOSE 80/tcp