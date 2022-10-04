#!/bin/bash

# Download WP-CLI tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null

# Check if WP-CLI has been downloaded
&& php wp-cli.phar --info > /dev/null

# Allow us to execute WP-CLI
&& chmod +x wp-cli.phar > /dev/null

# Move WP-CLI in local directory
&& sudo mv wp-cli.phar /usr/local/bin/wp > /dev/null

# Move configuration file to the right directory
&& sudo mv /etc/local/wp-configuration/www.conf /etc/php/7.3/fpm/pool.d/ > /dev/null

# Install wordpress
&& wp core download > /dev/null

# Configure WP databases
&& wp core config --dbname=wordpress --dbuser=utilisateur --dbpass=motdepasse --dbhost=localhost --dbprefix=wp_ > /dev/null

# Add some informations to WP
&& wp core install --url="votredomaine.com" --title="Titre du Site" --admin_user="nomdutilisateur_admin" --admin_password="motdepasse_administrateur" --admin_email="votre@email.com" > /dev/null
