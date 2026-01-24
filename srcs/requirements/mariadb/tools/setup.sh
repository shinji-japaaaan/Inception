#!/bin/bash
set -e

# mysqld 実行用ディレクトリ
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

cd /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# 初回起動のみ DB 初期化
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing database..."
  mariadb-install-db \
    --user=mysql \
    --basedir=/usr \
    --datadir=/var/lib/mysql \
    > /dev/null

  mysqld --user=mysql --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost'
  IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

  echo "Database initialized."
fi

# mysqld を PID1 にする
exec mysqld --user=mysql --bind-address=0.0.0.0
