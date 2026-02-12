#!/bin/bash

read -p "Github password... " passwd
echo -e $passwd >> /home/alumno/artyhub/passwd
docker compose pull
docker compose up -d --build
