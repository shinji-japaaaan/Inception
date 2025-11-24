FROM debian:bullseye

# パッケージインストール
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-cli \
    php7.4-curl \
    php7.4-zip \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-json \
    php7.4-opcache \
    mariadb-client \
    wget curl unzip git gnupg \
 && rm -rf /var/lib/apt/lists/*

# WP-CLI インストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

# セットアップスクリプトコピー
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

# php-fpm の起動は setup.sh 内で行うか、ここで行うか選択
ENTRYPOINT ["bash", "/usr/local/bin/setup.sh"]

