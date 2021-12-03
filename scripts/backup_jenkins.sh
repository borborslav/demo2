#!/bin/bash
echo "Натайпай IP сервера"
read server_ip
ssh borys@$server_ip < ./run.sh
scp borys@$server_ip:/home/borys/backup/jenkins.tar.gz .

