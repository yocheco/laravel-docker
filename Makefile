dir=${CURDIR}
export COMPOSE_PROJECT_NAME=laravel

ifndef APP_ENV
	# Determine if .env file exist
	ifneq ("$(wildcard .env)","")
		include .env
	endif
endif

project=-p ${COMPOSE_PROJECT_NAME}
service=${COMPOSE_PROJECT_NAME}:latest
interactive:=$(shell [ -t 0 ] && echo 1)
ifneq ($(interactive),1)
	optionT=-T
endif
ifeq ($(GITLAB_CI),1)
	# Determine additional params for phpunit in order to generate coverage badge on GitLabCI side
	phpunitOptions=--coverage-text --colors=never
endif

build:
	@docker-compose -f docker-compose.yml build

build-no-cache:
	@docker-compose -f docker-compose.yml build --no-cache

start:
	@docker-compose -f docker-compose.yml $(project) up -d

stop:
	@docker-compose -f docker-compose.yml $(project) down

exec:
	@docker-compose $(project) exec $(optionT) app $$cmd

exec-bash:
	@docker-compose $(project) exec $(optionT) app bash -c "$(cmd)"

composer-install:
	@make exec-bash cmd="COMPOSER_MEMORY_LIMIT=-1 composer install --optimize-autoloader"

composer-update:
	@make exec-bash cmd="COMPOSER_MEMORY_LIMIT=-1 composer update"

key-generate:
	@make exec cmd="php artisan key:generate"

key-install-laravel:
	@make exec cmd="composer create-project laravel/laravel:^8.0 ."
