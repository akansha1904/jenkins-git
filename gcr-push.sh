#!/bin/bash


echo "image push"
docker tag tomcat-70998/jenkins-assignment:v3 gcr.io/tomcat-70998/jenkins-assignment:v3
cat "$CREDENTIALS_ID" > key.json
docker login -u _json_key -p "$(cat key.json)" https://gcr.io
docker push gcr.io/tomcat-70998/jenkins-assignment:v3
docker logout https://gcr.io
     



