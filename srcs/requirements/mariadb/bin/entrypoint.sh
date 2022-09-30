#!/bin/bash

VOLUME_HOME="/var/lib/mysql"
chmod 644 /etc/mysql/mariadb.conf.d/*.cnf

if [[ ! -f $VOLUME_HOME/initialized ]]; then
    echo "=> An empty or uninitialized MariaDB volume is detected in $VOLUME_HOME"
    echo "=> Installing MariaDB ..."
    bash /usr/local/bin/setup_db.sh
else
    echo "=> Using an existing volume of MariaDB"
fi

bash /usr/bin/mysqld_safe &

# Put VOLUME_HOME in .env file