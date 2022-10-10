#!/bin/bash

sudo docker-compose down
sudo docker system prune -af
sudo docker volume rm $(sudo docker volume ls -q)
sudo docker rm -f $(sudo docker ps -a -q)

