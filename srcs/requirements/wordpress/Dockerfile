FROM php:8.0-fpm

# 必要パッケージをインストール
RUN apt-get update && apt-get install -y \
    mariadb-client \
    wget \
    unzip \
    less \
    default-mysql-client \
    curl \
    git \
    unzip \
    vim \
    gnupg

# PHP 拡張のインストール
RUN docker-php-ext-install mysqli

# WP-CLI インストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# 作業ディレクトリ
WORKDIR /var/www/html

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]
