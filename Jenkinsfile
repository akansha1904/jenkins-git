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
            
             sh './deploy.sh '
        }
}
        stage("List") {
         steps {
            sh ' ./kube-pods.sh '
           }
        }
    }
}
                       
                        
