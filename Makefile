DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
BASH = /bin/bash
CLEAR_FILE = ./srcs/.dev/clear_all.sh
VOLUME_PATH = /home/mamaurai/data

up:		# create_volume
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build

up-back: # create_volume
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -d

stop:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop

clean:	# destroy_volume
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} down

dclean: # destroy_volume
		${BASH} ${CLEAR_FILE} || true

restart:
		# destroy_volume
		# create_volume
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop || true
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build

drestart:
		# destroy_volume
		# create_volume
		${BASH} ${CLEAR_FILE} || true
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build

create_volume:
		sudo mkdir -p ${VOLUME_PATH}/wordpress ${VOLUME_PATH}/mariadb

destroy_volume:
		sudo mkdir -p ${VOLUME_PATH}/wordpress ${VOLUME_PATH}/mariadb

status:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} ps
		
logs:
		${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} logs --tail=100


# configurer volume path

# BUG CSS doesn't work sometimes