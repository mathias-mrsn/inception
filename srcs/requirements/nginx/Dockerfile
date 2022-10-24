FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install nginx \
	&& apt-get -y install openssl

RUN mkdir -p /etc/nginx/ssl/private
RUN chmod 755 /etc/nginx/ssl/private
RUN openssl req -nodes -x509 -out /etc/nginx/ssl/key.pem -keyout /etc/nginx/ssl/private/pkey.pem -subj "/C=FR/ST=Ile-De-France/L=Paris/O=42/OU=42/CN=42.fr/UID=mamaurai"

COPY srcs/server.conf /etc/nginx/nginx.conf
