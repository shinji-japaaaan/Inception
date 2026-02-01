# **Environment Setup**
1. Prerequisites: Docker, Docker Compose, GNU Makeがインストールされた仮想マシン（Debian/Ubuntu推奨）。 
2. Configuration: srcs/.env を作成し、DOMAIN_NAME, MYSQL_USER, MYSQL_PASSWORD 等の変数を定義します。 

# **Build and Launch**
- make all: ホスト側ディレクトリの作成、イメージのビルド、コンテナの起動を順次行います。 

# **Useful Commands**
- docker-compose logs -f: 全サービスのログをリアルタイムで確認。 
- docker exec -it <container_name> sh: コンテナ内でのデバッグ。 

# **Data Persistence**
- Location: ホストマシンの /home/sishizaw/data/ 以下。 
 - mariadb/: データベースファイル
 - wordpress/: ウェブサイトのソースファイル
- Mechanism: Dockerの local ドライバーを使用した bind マウントによって、コンテナ削除後もデータが保持されます。