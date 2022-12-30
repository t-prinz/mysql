#!/bin/bash

# Set the environment variables

. ../.env

podman run -d \
           --rm \
           --name mysql \
           -e MYSQL_USER=${MYSQL_USER} \
           -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
           -e MYSQL_DATABASE=${MYSQL_DATABASE} \
           -p 3306:3306 \
           -v /home/tprinz/mysql/podman/mysql_data:/var/lib/mysql/data \
           registry.redhat.io/rhel9/mysql-80
