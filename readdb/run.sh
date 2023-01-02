#!/bin/bash

script_path=`readlink -f ${BASH_SOURCE:-$0}`
script_dir=`dirname ${script_path}`

# Set the environment variables

. ${script_dir}/../.env

java -cp ~/.m2/repository/com/mysql/mysql-connector-j/8.0.31/mysql-connector-j-8.0.31.jar:target/readdb-1.0-SNAPSHOT.jar io.tprinz.App
