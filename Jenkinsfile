pipeline {
    agent any
    environment {
        PROJECT_ID = 'tomcat-70998'
        CLUSTER_NAME = 'tomcat-service'
	LOCATION = 'us-central1-c'
	CREDENTIALS_ID = 'tomcat' 
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
            sh ' ./deploy.sh '
           }
        }
        stage("List") {
         steps {
            sh ' ./kube-pods.sh '
           }
        }
    }
}
