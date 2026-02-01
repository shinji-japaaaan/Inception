# **Services Provided**
- NGINX: ポート443でのHTTPSアクセスを提供（TLSv1.2/1.3）。 
- WordPress: ブログ/ウェブサイト管理システム（php-fpm経由）。 
- MariaDB: データの永続化を担うデータベース。 

# **How to Start and Stop**
- 起動: make または make all を実行します。 
- 停止: make stop を実行します（データは保持されます）。 
- 全削除: make fclean を実行します。

# **Accessing the Website**
- URL: https://sishizaw.42.fr 
- WP管理パネル: https://sishizaw.42.fr/wp-admin 

# **Credential Management**
- 機密情報は srcs/.envのファイルで管理されています。 
- Gitリポジトリには含まれないため、ローカルで適切に設定する必要があります。 

# **Checking Service Status**
- docker ps を実行し、mariadb, wordpress, nginx の全てのステータスが Up であることを確認してください。