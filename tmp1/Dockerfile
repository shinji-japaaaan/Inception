FROM debian:bullseye

# パッケージインストール
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-cli \
    php-curl \
    php-zip \
    php-mbstring \
    php-xml \
    php-json \
    php-opcache \
    mariadb-client \
    wget \
    curl \
    unzip \
    git \
    gnupg \
 && rm -rf /var/lib/apt/lists/*

# php-fpm7.4 を php-fpm で呼べるようにシンボリックリンク作成
RUN ln -s /usr/sbin/php-fpm7.4 /usr/local/bin/php-fpm

# PHP-FPM PID 用ディレクトリ作成
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# PHP-FPM を TCP 待機に変更
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' \
    /etc/php/7.4/fpm/pool.d/www.conf

# WP-CLI インストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

# セットアップスクリプトコピー
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

# php-fpm の起動は setup.sh 内で行うか、ここで行うか選択
ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]

