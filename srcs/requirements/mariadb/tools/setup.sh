#!/bin/bash

# 初回起動用：データディレクトリの初期化（必要なら）
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing database..."
  mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql > /dev/null
fi

# MariaDB をブートストラップモードで起動し、ユーザー・DB作成
mysqld --user=mysql --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# 通常の MariaDB サーバとして起動
exec mysqld_safe --user=mysql --bind-address=0.0.0.0