
all : up

up :
	@echo "Building the containers ... "
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@docker-compose -f ./srcs/docker-compose.yml build

ps :
	@docker ps

down :
	@echo "Removing the containers ... "
	@docker-compose -f ./srcs/docker-compose.yml down

start :
	@echo "Starting the containers ... "
	@docker-compose -f ./srcs/docker-compose.yml start

re : down build up

.phony : all up build ps down start re