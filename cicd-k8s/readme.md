# Setup CICD on Kubernetes with Jenkins

## Configure Jenkins

Create lxc profile

###### copy the contents from the common-lxc-profile-config
```
lxc profile list
lxc profile copy default common-lxc-profile
lxc profile edit common-lxc-profile
```
Create jenkins lxc container.

```
lxc launch images:centos/7 jenkins --profile common-lxc-profile
```
