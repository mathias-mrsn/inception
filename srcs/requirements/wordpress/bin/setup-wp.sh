#!/bin/bash

# Download WP-CLI tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null

# Check if WP-CLI has been downloaded
php wp-cli.phar --info > /dev/null

# Allow us to execute WP-CLI
chmod +x wp-cli.phar > /dev/null

# Move WP-CLI in local directory
mv wp-cli.phar /usr/local/bin/wp > /dev/null

# Move configuration file to the right directory
mv /etc/local/wp-configuration/www.conf /etc/php/7.3/fpm/pool.d/ > /dev/null
mv /etc/local/wp-configuration/wp-config.php /etc/php/7.3/fpm/pool.d/ > /dev/null

# Install wordpress
wp core download --allow-root > /dev/null

# Configure WP databases
wp core config --allow-root --dbname=Inception --dbuser=mamaurai --dbpass=Inception123 --dbhost=mariadb:3306 --dbprefix=wp_ > /dev/null

# Add some informations to WP
wp core install --allow-root --url="mamaurai.42.fr" --title="Titre du Site" --admin_user="ben" --admin_password="lebenjos" --admin_email="ben@email.com" > /dev/null

# docker network create net
# docker run --net=net_test -p 443:443
# docker volume create -d wordpress_volume
# docker run -d -v wordpress_volume:/var/www/html 