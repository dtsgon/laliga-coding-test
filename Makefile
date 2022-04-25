#!/bin/bash

UID = $(shell id -u)
DOCKER_BE = laliga
WEBSERVER = laliga_php8.1-apache_1
DATABASE = laliga_mariadb_1

help: ## Show this help message
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

init: ## Init the containers
	docker network create laliga-network || true
	U_ID=${UID} docker-compose up -d
	U_ID=${UID} docker exec --user ${UID} ${WEBSERVER} composer install --no-interaction
	U_ID=${UID} docker exec -it --user ${UID} ${WEBSERVER} /var/www/html/bin/console doctrine:migrations:migrate -n
	clear
	@echo 
	@echo "========== Iniciar aplicación =========="
	@echo 
	@echo "  RUN: $ make start"
	@echo 
	@echo 
	@echo 

	
start: ## Start the containers
	docker network create laliga-network || true
	U_ID=${UID} docker-compose up -d
	clear
	@echo 
	@echo "============= Aplicaciones ============="
	@echo 
	@echo "  API:  http://localhost:180/API"
	@echo "  CRUD: http://localhost:180/CRUD"
	@echo 
	@echo 
	@echo "  Usar la colección de Postman: 'La Liga.postman_collection.json'"
	@echo 
	@echo 

	
stop: ## Stop the containers
	U_ID=${UID} docker-compose stop

restart: ## Restart the containers
	$(MAKE) stop && $(MAKE) start

build: ## Rebuilds all the container
	docker network create laliga-network || true
	U_ID=${UID} docker-compose build

prepare: ## Runs backend commands
	$(MAKE) composer-install

run: ## starts the Symfony development server
	U_ID=${UID} docker exec -it --user ${UID} ${WEBSERVER} symfony serve -d

logs: ## Show Symfony logs in real time
	U_ID=${UID} docker exec -it --user ${UID} ${WEBSERVER} symfony server:log

ssh-apache: ## bash into the be container
	U_ID=${UID} docker exec -it --user ${UID} ${WEBSERVER} bash

ssh-maria: ## bash into the be container
	U_ID=${UID} docker exec -it --user ${UID} ${DATABASE} bash

code-style: ## Runs php-cs to fix code styling following Symfony rules
	U_ID=${UID} docker exec --user ${UID} ${WEBSERVER} php-cs-fixer fix src --rules=@Symfony

