FROM alpine:3.17

RUN apk add nginx openssl

COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

ENTRYPOINT ["sh", "/setup.sh"]
