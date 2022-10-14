#!/bin/bash

if [ ! -f ".vsftpd_installed" ]; then
    addgroup ftp_users
    useradd -m mamaurai
    echo "mamaurai:Inception123" | /usr/sbin/chpasswd
    usermod -g ftp_users mamaurai
    mkdir -p /var/run/vsftpd/empty
    touch .vsftpd_installed
else
    echo "=> vsftpd already installed"
fi

/usr/sbin/vsftpd /etc/vsftpd.conf