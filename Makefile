#!make
NAME		:= shikher1/experimental
TAG			:= $$(echo $$(git describe --dirty --abbrev=7 --tags --always --first-parent --long))
BASENAME	:= ${NAME}
IMG			:= ${BASENAME}:${TAG}
EXPERIMENTAL:= ${BASENAME}:experimental
LATEST		:= ${BASENAME}:latest


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

check-uncommitted:
    ifneq ($(shell echo `git status -s`),)
		$(error Please commit files before building.)
    endif

build-no-check:
	docker build --build-arg tag=${TAG} -t ${IMG} .

build: check-uncommitted build-no-check

push:
	docker push ${IMG}

push-as-latest:
	docker pull ${IMG}
	docker tag ${IMG} ${LATEST}
	docker push ${LATEST}

all: build push push-as-latest

experimental:
	docker build --build-arg tag=${TAG} -t ${EXPERIMENTAL} .
	docker push ${EXPERIMENTAL}

login:
	docker login

test-tag:
	echo ${TAG}
