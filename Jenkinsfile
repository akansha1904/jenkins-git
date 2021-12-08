pipeline {
    agent any
    environment {
        GCLOUD_PATH='/home/aka/google-cloud-sdk/bin'
        PROJECT_ID = 'tomcat-70998'
        CLUSTER_NAME = 'tomcat-service'
	LOCATION = 'us-central1-c'
	CREDENTIALS_ID = credentials('jenkins-project') 
    }

    
    stages {
        stage("Build") {
          steps {
             sh ' ./build.sh '

             }
        }
        stage("Push") {
           steps {
            sh ' ./gcr-push.sh '

           }
        }
        stage("Deploy") {
         steps {
            
             
		sh """

					#!/bin/bash 
					echo "deploy stage";
		curl -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-225.0.0-linux-x86_64.tar.gz;
					tar -xvf /tmp/google-cloud-sdk.tar.gz -C /tmp/;
					/tmp/google-cloud-sdk/install.sh -q;
                    			
                    			source /tmp/google-cloud-sdk/path.bash.inc;
					
					
					 gcloud config set project ${PROJECT_ID};
					 gcloud components install kubectl
					 
                                         
					 gcloud auth activate-service-account --key-file ${CREDENTIALS_ID};
					 
					 gcloud config list;
					 gcloud container clusters get-credentials tomcat-service --zone us-central1-c
					 kubectl create -f deployment.yml

                    			 echo "Deployed to GCP"
				"""
					
           }
        }
        stage("List") {
         steps {
            sh ' ./kube-pods.sh '
           }
        }
    }
}
                       
                        
