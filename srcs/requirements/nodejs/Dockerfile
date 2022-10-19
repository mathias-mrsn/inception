FROM debian:buster

RUN apt-get update -y \
    && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y aptitude \
    && aptitude install -y npm \
    && apt-get install -y vim
    # && npm install -g npm@8.19.2

EXPOSE 3000

RUN mkdir -p /etc/local/nodejs
COPY ./bin/entrypoint.sh /etc/local/nodejs/entrypoint.sh
COPY ./srcs/server etc/local/nodejs
COPY ./srcs/www /var/www/html

RUN npm install --prefix /etc/local/nodejs \
    && npm install --prefix /etc/local/nodejs -g npm@8.19.2
