#!bin/bash

echo "[Task 1] - preparing Jenkins..."

yum -y install java-1.8.0-openjdk-devel 

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | tee /etc/yum.repos.d/jenkins.repo 

rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key 

yum -y install jenkins 

systemctl start jenkins 

echo "[Task 1 ] Jenkins installed."
