
echo " Deploying to cluster "


cat "$CREDENTIALS_ID" > key.json
echo "deploy stage";
          

           
             
                        
docker login -u _json_key -p "$(cat key.json)" https://gcr.io
   gcloud auth activate-service-account --key-file=${CREDENTIALS_ID}
gcloud container clusters get-credentials tomcat-service --zone us-central1-c --project tomcat-70998
kubectl create -f deployment.yml
 
docker logout https://gcr.io




