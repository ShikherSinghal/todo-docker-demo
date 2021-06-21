#!make
include .env
.PHONY: login deploy down fetch_initial_data

dcprod	= docker-compose -f docker-compose.yml

login:
	docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}

deploy: login
	$(dcprod) pull backend
	$(dcprod) pull frontend
	$(dcprod) up -d

down: login
	$(dcprod) down
