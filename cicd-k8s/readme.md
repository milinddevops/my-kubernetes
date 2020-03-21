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
cat jenkins.sh | lxc exec jenkins bash
```

Create kmaster, kworker1 kworker2

```
lxc launch images:centos/7 kmaster --profile common-lxc-profile
lxc launch images:centos/7 kworker1 --profile common-lxc-profile
lxc launch images:centos/7 kworker2 --profile common-lxc-profile
```

Configure kubernetes cluster

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

Verfiy the cluster information and default services are runninng.

```
kubectl get all
kubectl get svc
```
Configure kubernetes cluster with jenkins

Pull the kubernetes config file on the local host machine and push into the jenkins user home directory

```
lxc file pull kmaster/root/.kube/config .
lxc file push config jenkins/var/lib/jenkins/
```

Verify the kubernetes cluster is accessible

```
kubectl get all
```
