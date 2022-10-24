FROM debian:buster

RUN apt-get -y update \
    && apt-get install -y vsftpd \
    && apt-get install -y ftp \
    && apt-get install -y ufw

RUN mkdir -p /etc/local/vsftpd

COPY ./bin/entrypoint.sh /etc/local/vsftpd/entrypoint.sh
COPY ./configuration/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT ["/bin/sh", "/etc/local/vsftpd/entrypoint.sh"]