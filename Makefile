DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
BASH = /bin/bash
CLEAR_FILE = ./srcs/.dev/clear_all.sh

up:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build

up-back:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -d

stop:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop

clean:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} down

dclean:
		${BASH} ${CLEAR_FILE} || true

restart:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop || true
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build

drestart:
		${BASH} ${CLEAR_FILE} || true
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build

status:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} ps
		
logs:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} logs --tail=100


# configurer volume path

# BUG CSS doesn't work sometimes