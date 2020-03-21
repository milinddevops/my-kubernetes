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
- Setup LXD - The setup will ask few questions that will design the lxd setup on your local environment.
  ```
  lxd init
  Would you like to use lxd clustring? (yes/no) [default=no]: no
  Do you want to configure a new storage pool? (yes/no) [default=yes]: yes
  Name of the new storage pool [default=default]: default
  Name of the storage backend to use (trfs, dir, lvm) [default=btrfs]: dir
  Would you like to connect to a MASS server? (yes/no) [default=no]: no
  Would you like to create a new local network bridge? (yes/no) [default=yes]: yes
  What shoud the new bridge called? [default=lxdbr0]: lxdbr0
  What IPv4 address should be used? (CIDR subnet notation, "auto" or "none") [default=auto]: auto
  What IPv6 address should be used? (CIDR subnet notation, "auto" or "none") [default=auto]: auto
  Would you like lxd to be availale over the network? (yes/no) [default=yes]: yes
  Would you like scale cached images to be updated automatically? (yes/no) [default=yes]: yes
  Would you like YMAL "lxd init" preseed to be printed? (yes/no) [default=no]: no

  lxc version

  lxc help
  ```

  If you need more help for a specific command then you can use.
  ```
  lxc help <command-name>
  ```

  You can list the location where exactily the lxc stores the machine images.

  ```
  lxc storage list
  ```

 The LXD will pull the images from the remote location, to list that you can use following command.

 ```
 lxc remote list
 ```

 To launch the lxd machine you can use the follwing command.

 ```
 lxc image list

 lxc image list images:

 lxc image list images:centos

 ```

 The lxd containers commands

 To list all running containers
 ```
 lxc list
 ```

 To launch new container, here in this command the ubuntu-16.04 image container will start.
 ```
 lxc launch ubuntu:1604 - start a new container
 ```

To check the birdge network for lxd containers

```
ip a p
```
Container mantainance commands

```
lxc stop <container-name>
lxc start <container-name>
lxc delete <container-name>
lxc delete --force <container-name>
lxc image list
lxc launch ubuntu:16.04 my-cubuntu
lxc copy my-ubuntu my-copy-ubuntu - quick way to create container
```
To move one container to another
```
lxc stop <container-name>
lxc move <container-name1> <container-name2>
```

To connect from one container to another containers
```
lxc exec <container-name> bash

```

## Configure kubernetes cluster on lxd Containers

Create kubernetes master and two worker node containers.
```
lxc launch images:centos/7 kmaster
lxc launch images:centos/7 kworker1
lxc launch images:centos/7 kworker2
```

Install the common compoenents on all the node containers.
```
cat bootstrap.sh | lxc exec kmaster bash
```

Configure the kubernetes master node container.
```
cat bootstrap_kmaster.sh | lxc exec kmaster bash
```

Configure the kubernetes node container.
```
cat bootstrap_kworker.sh | lxc exec kworker bash
```
