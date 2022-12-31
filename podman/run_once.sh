#!/bin/bash

script_path=`readlink -f ${BASH_SOURCE:-$0}`
script_dir=`dirname ${script_path}`

echo "Creating database files in directory:  ${script_dir}/mysql_data"

mkdir ${script_dir}/mysql_data

# Change SELinux file context

sudo semanage fcontext --add -t container_file_t "${script_dir}/mysql_data(/.*)?"
sudo restorecon -R ${script_dir}/mysql_data

# Change ownership of directory; inspect the image to obtain this:
#
# podman inspect registry.redhat.io/rhel9/mysql-80 |grep '"User"'

podman unshare chown -R 27.27 ${script_dir}/mysql_data

