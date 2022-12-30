# Example showing how to deploy MySQL to OpenShift

## Prerequisites

* Access to an OpenShift cluster
* The oc CLI from the OpenShift cluster
* This assumes you are logged in to the cluster and are in your project

## Define the environment variables that are used to create the secret

    cp ../.env.EXAMPLE ../.env
    vi ../.env

## Create the secret

    oc create secret generic mysql \
                     --from-literal MYSQL_USER=${MYSQL_USER} \
                     --from-literal MYSQL_PASSWORD=${MYSQL_PASSWORD} \
                     --from-literal MYSQL_DATABASE=${MYSQL_DATABASE}

## Create the PVC

    oc create -f pvc.yaml 

## Create the application.  This will fail because the required environment variables are not specified.

    oc new-app --name mysql --image-stream mysql:8.0-el8

## Set the required environment variables using the secret

    oc set env --from secret/mysql deployment/mysql

## Modify the deployment to use peristent storage for the database

    oc set volume deployment/mysql --add --name=mysql-data -t pvc --claim-name mysql -m /var/lib/mysql/data 

## Manifest files

For reference, the manifest files (not including pvc.yaml) were captured after the application was deployed
