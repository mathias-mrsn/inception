#!/bin/bash

sleep 100;

# Download WP-CLI tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# Check if WP-CLI has been downloaded
php wp-cli.phar --info 

# Allow us to execute WP-CLI
chmod +x wp-cli.phar 

# Move WP-CLI in local directory
mv wp-cli.phar /usr/local/bin/wp 

# Move configuration file to the right directory
mv /etc/local/wp-configuration/www.conf /etc/php/7.3/fpm/pool.d/ 
# mv /etc/local/wp-configuration/wp-config.php /etc/php/7.3/fpm/pool.d/ 

/bin/bash
# Install wordpress
wp core download --allow-root --path="/var/www/html" 

# Configure WP databases
wp config create --allow-root --dbname=Inception --dbuser=mamaurai --dbpass=Inception123 --dbhost=mariadb:3306 --dbprefix=wp_ --config-file="/var/www/html/wp-config.php" --path="/var/www/html"

# Add some informations to WP
wp core install --allow-root --url="mamaurai.42.fr" --title="Titre du Site" --admin_user="ben" --admin_password="lebenjos" --admin_email="ben@email.com" --path="/var/www/html"

mkdir -p /run/php/

php-fpm7.3 -F

# docker network create net


# docker run --net=net_test -p 443:443
# docker volume create -d wordpress_volume
# docker run -d -v wordpress_volume:/var/www/html 