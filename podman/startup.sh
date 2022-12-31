#!/bin/bash

script_path=`readlink -f ${BASH_SOURCE:-$0}`
script_dir=`dirname ${script_path}`

# Set the environment variables

. ${script_dir}/../.env

podman run -d \
           --rm \
           --name mysql \
           -e MYSQL_USER=${MYSQL_USER} \
           -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
           -e MYSQL_DATABASE=${MYSQL_DATABASE} \
           -p 3306:3306 \
           -v ${script_dir}/mysql_data:/var/lib/mysql/data \
           registry.redhat.io/rhel9/mysql-80

# Sleep to give the process time to start

sleep 5

# Initialize the database

podman exec -i mysql mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ../initialize_db.sql
