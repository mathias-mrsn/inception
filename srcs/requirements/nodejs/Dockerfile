FROM debian:buster

RUN apt-get update -y \
    && apt-get install -y nodejs \
    && apt-get install -y npm

EXPOSE 3000

RUN mkdir -p /etc/local/nodejs
COPY ./bin/entrypoint.sh /etc/local/nodejs/entrypoint.sh
COPY ./srcs etc/local/nodejs

# ENTRYPOINT [ "/bin/bash", "/etc/local/nodejs/entrypoint.sh" ]