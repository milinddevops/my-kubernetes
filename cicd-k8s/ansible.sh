#!bin/bash

echo "Preparing Ansible server"
yum -y install epel-release

yum -y install ansible
echo "Ansible server is ready to use!"
