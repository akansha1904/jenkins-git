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
          script {
                    withCredentials([file(credentialsId: 'credentials', variable: 'GC_KEY')]) {
                        sh '''
                        gcloud auth activate-service-account --key-file=${GC_KEY}
                        gcloud container clusters get-credentials tomcat-service --zone us-central1-c --project tomcat-70998
                        kubectl create -f deployment.yaml
                        '''
                    }
                }
            }
        }
        stage('list') {
            steps {
                sh '''
                gcloud container images list --repository=gcr.io/tomcat-70998
                kubectl get pods
                kubectl get deploy
                '''
                }
         
            
    }
}


