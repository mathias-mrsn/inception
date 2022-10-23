FROM debian:buster

RUN apt-get -y update && \
    apt-get install -y \
    ca-certificates \
    curl \
    jq \
    tar \
    wget

RUN cd /opt \
    && wget https://github.com/portainer/portainer/releases/download/2.15.1/portainer-2.15.1-linux-amd64.tar.gz \
    && tar xvpfz portainer-2.15.1-linux-amd64.tar.gz

EXPOSE 9443/tcp

CMD ["/opt/portainer/portainer", "--admin-password", "$2y$05$yJS1JSLzA9kmNXkFEse1b.7Ivw8L4FtA5S8O7RzxYAq9UZtYJ9cVe"]
