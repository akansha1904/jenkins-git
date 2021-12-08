#!/bin/bash


echo "image push"
sudo docker tag jenkins-assignment:v2 gcr.io/tomcat-70998/jenkins-assignment:v2
cat "$CREDENTIALS_ID" > key.json
sudo docker login -u _json_key -p "$(cat key.json)" https://gcr.io
sudo docker push gcr.io/tomcat-70998/jenkins-assignment:v2
sudo docker logout https://gcr.io


