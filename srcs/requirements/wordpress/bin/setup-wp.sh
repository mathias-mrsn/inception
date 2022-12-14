#!/bin/bash

wp core download --allow-root --path="${WP_PATH}"
wp config create --allow-root --dbname=${DATABASE_NAME} --dbuser=${MY_USERNAME} --dbpass=${PASSWORD} --dbhost=${DB_HOST} --dbprefix=wp_ --config-file="${WP_PATH}/wp-config.php" --path="${WP_PATH}"
wp core install --allow-root --url="${DOMAIN_NAME}" --title=${WP_TITLE} --admin_user=${ADMIN_USERNAME} --admin_password=${ADMIN_PASSWORD} --admin_email="${ADMIN_MAIL}" --path="${WP_PATH}" --skip-email
wp user create --allow-root "${MY_USERNAME}" "${EMAIL}" --user_pass="${PASSWORD}" --path="${WP_PATH}"
wp config set WP_REDIS_HOST --allow-root "redis"
wp config set WP_REDIS_PORT --allow-root "6379"
wp config set WP_CACHE --allow-root "true"
wp config set FS_METHOD --allow-root "direct"
wp plugin install redis-cache --allow-root --path="${WP_PATH}" --activate
wp plugin update --all --allow-root --path="${WP_PATH}"
wp theme install --allow-root twentytwenty --activate --force
wp redis enable --allow-root
chown -R www-data:www-data /var/www
touch ${WP_PATH}/.initialized_wp
