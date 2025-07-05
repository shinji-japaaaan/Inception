#!/bin/bash

cd /var/www/html

if [ ! -f wp-config.php ]; then
  wget https://wordpress.org/latest.tar.gz
  tar -xzf latest.tar.gz
  mv wordpress/* .
  rm -rf wordpress latest.tar.gz

  wp config create \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=mariadb \
    --path=/var/www/html \
    --allow-root

  wp core install \
    --url=https://${DOMAIN_NAME} \
    --title="Inception42" \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --allow-root

  wp user create \
    ${WP_USER} ${WP_USER_EMAIL} \
    --user_pass=${WP_USER_PASS} \
    --role=author \
    --allow-root

  chown -R www-data:www-data /var/www/html
  chmod -R 755 /var/www/html
fi

php-fpm
