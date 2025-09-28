FROM php:8.0-fpm-bullseye

# 必要パッケージをインストール（最小限）
RUN apt-get update && apt-get install -y \
    mariadb-client \
    wget \
    curl \
    unzip \
    git \
    gnupg \
 && rm -rf /var/lib/apt/lists/*

# PHP拡張
RUN docker-php-ext-install mysqli

# WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]
