#!/bin/sh

mkdir -p /etc/ssl/certs /etc/ssl/private

openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=Inception/CN=sishizaw.42.fr"

mkdir -p /var/www/html

exec nginx -g "daemon off;"
