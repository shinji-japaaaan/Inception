FROM alpine:3.17

RUN apk add --no-cache nginx openssl

# 設定コピー
COPY conf/default.conf /etc/nginx/http.d/default.conf

# SSL 証明書作成はビルド時に一度だけ
RUN mkdir -p /etc/ssl/certs /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/C=JP/ST=Tokyo/L=Tokyo/O=42Tokyo/OU=Inception/CN=sishizaw.42.fr"

# Webルート作成
RUN mkdir -p /var/www/html

# nginx を PID 1 として起動
CMD ["nginx", "-g", "daemon off;"]

