# mkdir backup 
cd ~/backup
sudo mv jenkins.tar.gz jenkins_old.tar.gz
sudo docker stop jenkins
sudo tar -cvzf jenkins.tar.gz /var/jenkins_home/
sudo docker run --rm --name jenkins -d -p 8282:8080 -v /var/jenkins_home:/var/jenkins_home/ jenkins/jenkins
sudo rm jenkins_old.tar.gz
exit

