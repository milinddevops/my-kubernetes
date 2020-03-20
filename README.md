# my-kubernetes

This is a kubernetes POCs repository, the purpose is to provide a simple guidelines to viweres who are using kubernetes.
I am using lxd containers to spin up my kubernetes cluster, it is a light weight vms and very ussfull to perform all the operations.

## Setup Kubernetes Cluster on LXD Containers.

- Installing LXD on Ubuntu 18.04
  ```
  sudo apt-get install lxd
  sudo systemctl start lxd
  sudo systemctl status lxd
  ```
- Add your user into the LXD group to run the lxd commands
  ```
  sudo gpasswd -a <user-name> lxd
  ```
