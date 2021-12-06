#!/bin/bash


echo "image push"
docker tag jenkins-assignment:v2 gcr.io/tomcat-70998/jenkins-assignment:v2
cat "$CREDENTIALS_ID" > key.json
docker login -u _json_key -p "$(cat key.json)" https://gcr.io
docker push gcr.io/tomcat-70998/jenkins-assignment:v2
docker logout https://gcr.io


