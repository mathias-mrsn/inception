#!/bin/bash

RET=1
while [ $RET -ne 0 ]; do
    echo "=> Wordpress is waiting for confirmation of Mariadb service startup..."
    sleep 5
    mysqladmin -u ${USERNAME} -p${PASSWORD} -h mariadb ping > /dev/null 2>&1
    RET=$?
done

# Download WP-CLI tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# Check if WP-CLI has been downloaded
php wp-cli.phar --info 

# Allow us to execute WP-CLI
chmod +x wp-cli.phar 

# Move WP-CLI in local directory
mv wp-cli.phar /usr/local/bin/wp 

# Move configuration file to the right directory
mv ${WP_LOCAL_PATH}/www.conf /etc/php/7.3/fpm/pool.d/ 

bash ${WP_LOCAL_PATH}/setup-wp.sh