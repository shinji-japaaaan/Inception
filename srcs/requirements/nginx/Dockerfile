FROM debian:bookworm

# 必要パッケージのインストール
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
 && rm -rf /var/lib/apt/lists/*

# nginx 設定コピー
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# SSL 証明書作成（ビルド時に1回）
RUN mkdir -p /etc/ssl/certs /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=Inception/CN=sishizaw.42.fr"

# Web ルート作成
RUN mkdir -p /var/www/html

# nginx をフォアグラウンドで起動（PID1）
CMD ["nginx", "-g", "daemon off;"]
