FROM debian:buster

ARG PORTAINER_VERSION

RUN apt-get -y update && \
    apt-get install -y \
    ca-certificates \
    curl \
    jq \
    tar \
    wget

RUN cd /opt \
    && wget https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz \
    && tar xvpfz portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz
