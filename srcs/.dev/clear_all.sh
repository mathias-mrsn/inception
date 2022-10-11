#!/bin/bash

sudo docker-compose down
sudo docker system prune -af
sudo docker volume rm $(sudo docker volume ls -q)
