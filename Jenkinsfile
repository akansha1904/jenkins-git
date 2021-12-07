pipeline {
    agent any
    environment {
        PROJECT_ID = 'tomcat-70998'
        CLUSTER_NAME = 'tomcat-service'
	LOCATION = 'us-central1-c'
	CREDENTIALS_ID = credentials('jenkin') 
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
             withEnv(['GCLOUD_PATH=/var/jenkins_home/google-cloud-sdk/bin'])
             sh ' ./deploy.sh '
           }
        }
        stage("List") {
         steps {
            withEnv(['GCLOUD_PATH=/var/jenkins_home/google-cloud-sdk/bin'])
            sh ' ./kube-pods.sh '
           }
        }
    }
}
