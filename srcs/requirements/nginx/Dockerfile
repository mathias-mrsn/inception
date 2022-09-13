FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install nginx \
	&& apt-get -y install openssl \
	&& apt-get -y install vim \
	&& apt-get -y install curl

RUN mkdir -p /etc/nginx/ssl/private
RUN chmod 0755 /etc/nginx/ssl/private
RUN openssl req -nodes -x509 -out /etc/nginx/ssl/key.pem -keyout /etc/nginx/ssl/private/pkey.pem -subj "/C=FR/ST=Ile-De-France/L=Paris/O=42/OU=42/CN=42.fr/UID=mamaurai"

COPY srcs/server.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# TODO: Delete vim and curl