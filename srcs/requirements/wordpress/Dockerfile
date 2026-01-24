FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-curl \
    php8.2-zip \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-opcache \
    mariadb-client \
    wget curl unzip git \
 && rm -rf /var/lib/apt/lists/*

# --- ここを追加：WP-CLI のインストール ---
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
# ------------------------------------

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

RUN sed -i 's|listen = .*|listen = 9000|' \
    /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/setup.sh"]