all:
	mkdir -p /home/aitaouss/data/mariadb
	mkdir -p /home/aitaouss/data/wordpress
	mkdir -p /home/aitaouss/data/redis
	mkdir -p /home/aitaouss/data/portainer
	docker compose up -d --build

build:
	docker compose build

down:
	docker compose down

clean: down
	docker system prune -af
	docker rmi -f $(shell docker images -q)
	docker volume rm  $(shell docker volume ls -q)
	chmod -R u+w /home/aitaouss/data
	rm -rf /home/aitaouss/data

remove:
	chmod -R u+w /home/aitaouss/data
	rm -rf /home/aitaouss/data

restart: down up

