#!/bin/bash
set -e

cd /var/www/html

# ------------------------------
# MariaDB の起動待ち
# ------------------------------
echo "[+] Waiting for MariaDB..."
while ! mysqladmin ping -h "$WORDPRESS_DB_HOST" --silent; do
    sleep 2
done
echo "[+] MariaDB is ready!"

# ------------------------------
# WordPress 初回セットアップ
# ------------------------------
if [ ! -f wp-config.php ]; then
  echo "[+] Downloading WordPress..."
  wget https://wordpress.org/latest.tar.gz
  tar -xzf latest.tar.gz
  mv wordpress/* .
  rm -rf wordpress latest.tar.gz

  echo "[+] Creating wp-config.php..."
  wp config create \
    --dbname="$MYSQL_DATABASE" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --path=/var/www/html \
    --allow-root

  echo "[+] Installing WordPress core..."
  wp core install \
    --url="https://${DOMAIN_NAME}" \
    --title="Inception42" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASS" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

  echo "[+] Creating additional user..."
  wp user create \
    "$WP_USER" "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PASS" \
    --role=author \
    --allow-root

  # 所有権とパーミッションの修正
  chown -R www-data:www-data /var/www/html
  chmod -R 755 /var/www/html
fi

# ------------------------------
# PHP-FPM をフォアグラウンドで起動
# ------------------------------
echo "[+] Starting PHP-FPM..."
exec php-fpm -F

