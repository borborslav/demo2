#!/bin/bash
echo "Натайпай IP сервера"
read server_ip
scp ./jenkins.tar.gz borys@$server_ip:~/
ssh borys@$server_ip < ./run2.sh


