pipeline {
    agent any
    environment {
        APP_NAME = "demo1"
        CONTAINER_NAME = "demo1-container"
        HOST_PORT = "8081"
        CONTAINER_PORT = "80"
    }
    
    stages {
        stage ('welcom'){
            steps {
                echo "Starting DevOps project"
            }
        }
        
        stage ('check server') {
            steps {
                sh 'whoami'
                sh 'hostname'
                sh 'docker --version'
            }
        }
        
        stage ('Clone Repository') {
            steps {
                git 'https://github.com/Sansuraj09/demo1.git'
            }
        }
        
        stage ('chech project file') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }
        stage ('Build images') {
            steps {
                sh 'docker build -t $APP_NAME .'
            }
        }
        stage ('chech docker image') {
            steps {
                sh 'docker images'
            }
        }
        
        stage ('Run container') {
            steps {
                sh '''
                docker run -d \
                --name $CONTAINER_NAME \
                -p $HOST_PORT:$CONTAINER_PORT \
                $APP_NAME
                '''
            }
        }
        stage ('check container') {
            steps {
                sh 'docker ps'
            }
        }
        
        stage ('Apliction URL') {
            steps {
                sh '''
                IP=$(hostname -I | awk '{print $1}')
                echo "Application is available at:"
                echo "http://$IP:$HOST_PORT"
                '''
            }
        }
    }
    post {
            success {
                echo 'Pipeline completed successfully!'           
            }
            failure {
                 echo 'Pipeline failed. Check console output.'
            }
        }
}
