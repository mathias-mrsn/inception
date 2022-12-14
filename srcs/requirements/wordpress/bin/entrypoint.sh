#!/bin/bash

RET=1
while [ $RET -ne 0 ]; do
    echo "=> Wordpress is waiting for confirmation of Mariadb service startup..."
    sleep 2
    mysqladmin -u ${MY_USERNAME} -p${PASSWORD} -h mariadb ping > /dev/null 2>&1
    RET=$?
done

if [ ! -f ${WP_PATH}/.initialized_wp ]; then 
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php
    mv object-cache.php /var/www/html/wp-content/
    php wp-cli.phar --info 
    chmod +x wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp 
    mv ${WP_LOCAL_PATH}/www.conf /etc/php/7.3/fpm/pool.d/ 
    bash ${WP_LOCAL_PATH}/setup-wp.sh
else
    echo "=> Wordpress already installed"
fi

exec "$@"
