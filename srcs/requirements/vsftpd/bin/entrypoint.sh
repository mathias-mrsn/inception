#!/bin/bash

if [ ! -f ".vsftpd_installed" ]; then
    addgroup ${FTP_GROUP}
    useradd -m ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASSWORD}" | /usr/sbin/chpasswd
    usermod -g ${FTP_GROUP} ${FTP_USER}
    mkdir -p /var/run/vsftpd/empty
    touch .vsftpd_installed
    echo "This is a example of text" > /home/${FTP_USER}/example.txt
    echo "vsftpd installed, you can now connect to the ftp server with (mamaurai:Inception123 on port 21)"
else
    echo "=> vsftpd already installed"
fi

exec "$@"

# How to test
# Launch FileZilla with (localhost, mamaurai, Inception123, 21)