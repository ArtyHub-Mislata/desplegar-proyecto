#!/bin/bash

read -p "Github password... " passwd
echo -e $passwd >> /home/alumno/artyhub/passwd
docker compose down -v
docker compose build --no-cache
docker compose up -d
