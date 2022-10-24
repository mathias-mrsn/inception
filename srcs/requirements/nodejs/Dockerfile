FROM debian:buster

ARG NODEJS_SETUP
ARG NODEJS_PATH

RUN apt-get update -y \
    && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y aptitude \
    && aptitude install -y npm \
    && apt-get install -y vim


RUN mkdir -p ${NODEJS_PATH}
COPY ./srcs/server ${NODEJS_PATH}
COPY ./srcs/www /var/www/html

RUN npm install --prefix ${NODEJS_PATH} \
    && npm install --prefix ${NODEJS_PATH} -g npm@8.19.2
