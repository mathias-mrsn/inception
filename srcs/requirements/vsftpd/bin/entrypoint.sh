#!/bin/bash

# groupadd sftp_users
# useradd mamaurai -D -h /home/mamaurai
# echo "mamaurai:Inception123" | /usr/sbin/chpasswd
# usermod -g sftp_users mamaurai
# usermod -d /home/mamaurai mamaurai

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf