cd ~/
sudo docker stop jenkins
sudo tar -xvf jenkins.tar.gz -C /
rm jenkins.tar.gz
sudo docker run --rm --name jenkins -d -p 8282:8080 -v /var/jenkins_home:/var/jenkins_home/ jenkins/jenkins
sudo docker ps
sleep 2
exit
