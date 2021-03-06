#!/bin/bash 
sudo apt update -y 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
sudo apt update -y 
apt-cache policy docker-ce 
sudo apt install docker-ce -y 
sudo mkdir /var/jenkins_home/
sudo chmod 777 /var/jenkins_home/
sudo docker pull jenkins/jenkins
sudo docker run --rm --name jenkins -d -p 8282:8080 -v /var/jenkins_home:/var/jenkins_home/ jenkins/jenkins

