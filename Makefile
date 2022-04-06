de := docker exec php
sy := $(de) php bin/console

.PHONY: up
up:
	docker-compose up -d --build

.PHONY: install
install: $(de) composer install

.PHONY: migration
migration:
	$(sy) d:m:m -q

.PHONY: fixtures
fixtures: 
	$(sy) d:f:l -q	

.PHONY: start
start:
	cd app && npm i && npm start	

.PHONY: clear
clear:
	$(sy) cache:clear	

.PHONY: init
init: up install migration fixtures start