#!/bin/bash
if python3 checking.py == 'CNN'
then
if sudo docker ps -a | grep cnn_os
then 
sudo docker rm -f cnn_os
sudo docker run -dit -v /home/isha/mlops/project:/mlops --name cnn_os mlopsimage:v1
else
sudo docker run -dit -v /home/isha/mlops/project:/mlops --name cnn_os mlopsimage:v1
fi
fi

sudo docker rm -f mlops/accuracy_check.txt
sudo docker exec cnn_os  python3 /mlops/maincode.py

