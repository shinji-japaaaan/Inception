all:
	docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

fclean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all

re: fclean all
