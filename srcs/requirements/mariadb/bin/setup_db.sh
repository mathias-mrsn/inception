#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of Mariadb service startup..."
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating Mariadb database named Inception"

mysql -uroot -e "CREATE DATABASE Inception;"
mysql -uroot -e "CREATE USER 'ben'@'%' IDENTIFIED BY 'lebenjos'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'ben'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "CREATE USER 'mamaurai'@'%' IDENTIFIED BY 'Inception123'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON Inception.* TO 'mamaurai'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this Mariadb Server using:"
echo ""
echo "    mariadb -u'user' -p'password' -h<host> -P<port>"
echo ""
echo "========================================================================"

mysqladmin -uroot shutdown

touch /var/lib/mysql/initialized

# Names to change
# Inception -> $DATABASE_NAME
# ben -> $ROOT_USERNAME
# lebenjos -> $ROOT_PASSWORD
# mamaurai -> $USERNAME
# Inception123 -> $PASSWORD

# Variables to add
# VOLUME_HOME