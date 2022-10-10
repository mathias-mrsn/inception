DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = ./srcs/docker_compose.yml
BASH = /bin/bash
CLEAR_FILE = ./srcs/.dev/clear_all.sh

up:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -d

stop:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop

clear:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} down

dclear:
		${BASH} ${CLEAR_FILE}

restart: stop up

frestart: dclear up

status:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} ps
		
log:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} logs --tail=100


# .env
# finir Makefile
# entrypoint.sh pour wp
# wait mariadb dans wp entrypoint
# configurer volume path