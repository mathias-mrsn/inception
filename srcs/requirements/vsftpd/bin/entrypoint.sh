#!/bin/bash

if [ ! -f ".vsftpd_installed" ]; then
    addgroup ftp_users
    useradd -m mamaurai
    echo "mamaurai:Inception123" | /usr/sbin/chpasswd
    usermod -g ftp_users mamaurai
    mkdir -p /var/run/vsftpd/empty
    touch .vsftpd_installed
    echo "vsftpd installed, you can now connect to the ftp server with (mamaurai:Inception123 on port 21)"
else
    echo "=> vsftpd already installed"
fi

exec "$@"

# How to test
# Launch FileZilla with (localhost, mamaurai, Inception123, 21)