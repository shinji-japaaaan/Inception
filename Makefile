# ------------------------------------------------------------------------------
# 構成設定
# ------------------------------------------------------------------------------
NAME     = inception
COMPOSE  = docker-compose -f srcs/docker-compose.yml
# プロンプトにある通り、環境変数ファイルを明示的に指定
ENV      = --env-file srcs/.env

# ------------------------------------------------------------------------------
# ターゲット
# ------------------------------------------------------------------------------

# all: プロジェクト全体のセットアップ (要件: Chapter III [cite: 21, 22])
all: setup
	$(COMPOSE) $(ENV) up --build -d

# setup: 必須パート [cite: 91] に基づき、ホスト側のディレクトリを作成
# これを行わないと、名前付きボリュームのバインドが失敗する可能性があります。
setup:
	@sudo mkdir -p /home/sishizaw/data/mariadb
	@sudo mkdir -p /home/sishizaw/data/wordpress
	@sudo chmod -R 777 /home/sishizaw/data

# stop: コンテナの停止
stop:
	$(COMPOSE) stop

# down: コンテナとネットワークの削除
down:
	$(COMPOSE) down

# fclean: 完全にクリーンな状態にする (評価時に推奨) 
# コンテナ、イメージ、ネットワークに加え、ボリューム（データ）も削除します。
clean: down
	docker system prune -a

fclean: clean
	$(COMPOSE) down -v --rmi all
	@sudo rm -rf /home/sishizaw/data

# re: 完全に再構築
re: fclean all

.PHONY: all setup stop down clean fclean re