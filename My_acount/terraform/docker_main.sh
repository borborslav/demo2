#!/bin/bash 
sudo apt update -y 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
sudo apt update -y 
apt-cache policy docker-ce 
sudo apt install docker-ce -y 
sudo groupadd docker
sudo usermod -aG docker borys
sudo mkdir /var/jenkins_home/
sudo chmod 777 /var/jenkins_home/
sudo docker pull jenkins/jenkins
sudo docker run --rm --name jenkins -d -p 8282:8080 -v /var/jenkins_home:/var/jenkins_home/ jenkins/jenkins
sudo docker volume create db
sudo docker pull us.gcr.io/gcp101233-lv61301devops/646/postgres_lv646:latest
sudo docker run --rm --name db -d -e POSTGRES_PASSWORD=password -p 5432:5432 -v db:/var/lib/postgresql/data/ us.gcr.io/gcp101233-lv61301devops/646/postgres_lv646:latest
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker run --rm --name db -d -e POSTGRES_PASSWORD=password -p 5432:5432 -v db:/var/lib/postgresql/data/ us.gcr.io/gcp101233-lv61301devops/646/postgres_lv646:latest

