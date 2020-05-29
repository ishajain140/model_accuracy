#!/bin/bash
if python3 checking.py == 'CNN'
then
if sudo docker ps -a | grep cnn_os
then 
sudo docker rm -f cnn_os
sudo docker run -dit -v /var/lib/jenkins/workspace/github_pull:/project --name cnn_os mlopsimage:v1
else
sudo docker run -dit -v /var/lib/jenkins/workspace/github_pull:/project --name cnn_os mlopsimage:v1
fi
fi

sudo docker rm -f /project/accuracy_check.txt
sudo docker exec cnn_os  python3 /project/maincode.py

