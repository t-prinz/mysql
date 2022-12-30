#!/bin/bash

echo $0

script_path=`readlink -f ${BASH_SOURCE:-$0}`
echo "Full path to script:  ${script_path}"

script_dir=`dirname ${script_path}`

echo "Location of script:  ${script_dir}"


#sudo semanage fcontext --add -t container_file_t '/home/tprinz/mysql/podman/mysql_data(/.*)?'
#sudo restorecon -R /home/tprinz/mysql/podman/mysql_data

#podman unshare chown -R 27.27 mysql_data

