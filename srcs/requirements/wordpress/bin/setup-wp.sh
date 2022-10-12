#!/bin/bash

# Install wordpress
wp core download --allow-root --path="${WP_PATH}"

# Configure WP databases
wp config create --allow-root --dbname=${DATABASE_NAME} --dbuser=${USERNAME} --dbpass=${PASSWORD} --dbhost=${DB_HOST} --dbprefix=wp_ --config-file="${WP_PATH}/wp-config.php" --path="${WP_PATH}"

# Add some informations to WP
wp core install --allow-root --url="${DOMAIN_NAME}" --title=${WP_TITLE} --admin_user=${ADMIN_USERNAME} --admin_password=${ADMIN_PASSWORD} --admin_email="${ADMIN_EMAIL}" --path="${WP_PATH}"

# Create new user
wp user create --allow-root "${USERNAME}" "${EMAIL}" --user_pass="${PASSWORD}" --path="${WP_PATH}"

wp config set WP_REDIS_HOST --allow-root "redis"
wp config set WP_REDIS_PORT --allow-root "6379"

wp plugin install redis-cache --allow-root --path="${WP_PATH}" --activate
wp plugin update --all --allow-root
wp redis enable --allow-root

# Start PHP-FPM
mkdir -p /run/php/
php-fpm7.3 -F
