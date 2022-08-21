FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install nginx

COPY srcs/server.conf /etc/nginx/configuration_files/server.conf

EXPOSE 443
WORKDIR /.

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

