#!/bin/bash

echo "list pods"


cat "$CREDENTIALS_ID" > key.json
docker login -u _json_key -p "$(cat key.json)" https://gcr.io
 gcloud auth activate-service-account --key-file=${CREDENTIALS_ID}
gcloud container clusters get-credentials tomcat-service --zone us-central1-c --project tomcat-70998

gcloud container images list --repository=gcr.io/tomcat-70998


kubectl get pods

kubectl get deploy

docker logout https://gcr.io

