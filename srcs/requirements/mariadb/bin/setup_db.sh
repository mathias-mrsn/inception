#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of Mariadb service startup..."
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating Mariadb database named ${DATABASE_NAME}"

mysql -uroot -e "CREATE DATABASE ${DATABASE_NAME};"
echo "CREATE DATABASE ${DATABASE_NAME};"
mysql -uroot -e "CREATE USER '${ADMIN_USERNAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
echo "CREATE USER '${ADMIN_USERNAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USERNAME}'@'%' WITH GRANT OPTION"
echo "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USERNAME}'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"
echo "FLUSH PRIVILEGES;"
mysql -uroot -e "CREATE USER '${USERNAME}'@'%' IDENTIFIED BY '${PASSWORD}'"
echo "CREATE USER '${USERNAME}'@'%' IDENTIFIED BY '${PASSWORD}'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${USERNAME}'@'%' WITH GRANT OPTION"
echo "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${USERNAME}'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this Mariadb Server using:"
echo ""
echo "    mariadb -u'user' -p'password' -h<host> -P<port>"
echo ""
echo "========================================================================"

mysqladmin -uroot shutdown

touch ${INITIALIZED_FILE}/initialized

# Names to change
# Inception -> $DATABASE_NAME /
# ben -> $ROOT_USERNAME /
# lebenjos -> $ROOT_PASSWORD /
# mamaurai -> $USERNAME /
# Inception123 -> $PASSWORD /

# Variables to add
# INITIALIZED_FILE