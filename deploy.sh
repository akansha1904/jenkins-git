
echo " Deploying to cluster "


cat "$CREDENTIALS_ID" > key.json
docker login -u _json_key -p "$(cat key.json)" https://gcr.io
gcloud container clusters get-credentials tomcat-service --zone us-central1-c
kubectl create -f deployment.yml
 
docker logout https://gcr.io




