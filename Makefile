all: build up

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down -v

clean:
	docker system prune -af

restart: down up

logs:
	docker-compose logs -f

.PHONY: all build up down clean restart logs

