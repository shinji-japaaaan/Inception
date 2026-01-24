FROM debian:bookworm

# 必要パッケージのインストール（mariadb-server含む）
RUN apt-get update && apt-get install -y \
    mariadb-server \
    procps \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 初期化スクリプトをコピーして実行可能にする
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# MariaDB のデータディレクトリを作成（安全策）
# RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Entrypoint にスクリプトを指定
ENTRYPOINT ["/setup.sh"]
