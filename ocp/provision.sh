#!/bin/bash

# Set the environment variables

. ../.env

oc create secret generic mysql \
                 --from-literal MYSQL_USER=${MYSQL_USER} \
                 --from-literal MYSQL_PASSWORD=${MYSQL_PASSWORD} \
                 --from-literal MYSQL_DATABASE=${MYSQL_DATABASE}

oc new-app --name mysql --image-stream mysql:8.0-el8

oc set env --from secret/mysql deployment/mysql

oc create -f pvc.yaml 
oc set volume deployment/mysql --add --name=mysql-data -t pvc --claim-name mysql -m /var/lib/mysql/data 

dbpod=`oc get pods -l deployment=mysql -o jsonpath='{ .items[0].metadata.name}{"\n"}'`

echo "Initializing database"

oc rsh ${dbpod} mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ../initialize_db.sql
