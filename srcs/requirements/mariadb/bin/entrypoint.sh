#!/bin/bash

chmod 644 /etc/mysql/mariadb.conf.d/*.cnf

if [[ ! -f ${INITIALIZED_FILE}/initialized ]]; then
    echo "=> An empty or uninitialized MariaDB volume is detected in ${INITIALIZED_FILE}"
    echo "=> Installing MariaDB ..."
    bash /usr/local/bin/setup_db.sh
else
    echo "=> Using an existing volume of MariaDB"
fi

bash /usr/bin/mysqld_safe

# Put INITIALIZED_FILE in .env file