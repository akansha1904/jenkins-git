
echo " Deploying to cluster "


cat "$CREDENTIALS_ID" > key.json
echo "deploy stage";
            curl -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-365.0.1-linux-x86_64.tar.gz
 tar -xvf /tmp/google-cloud-sdk.tar.gz -C /tmp/
 /tmp/google-cloud-sdk/install.sh -q

 source /tmp/google-cloud-sdk/path.bash.inc;


             gcloud config set project ${PROJECT_ID}
             gcloud components install app-engine-java
             gcloud components install app-engine-python
             gcloud auth activate-service-account --key-file ${CREDENTIALS_ID}

             gcloud config list;
             
                        
docker login -u _json_key -p "$(cat key.json)" https://gcr.io
gcloud container clusters get-credentials tomcat-service --zone us-central1-c
kubectl create -f deployment.yml
 
docker logout https://gcr.io




