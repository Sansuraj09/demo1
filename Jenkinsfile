pipeline {
    agent any

    environment {
        IMAGE_NAME = "sansuraj09/demo1"
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
        CONTAINER_NAME = "demo1_app"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code..."
                git url: 'https://github.com/Sansuraj09/demo1.git', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f dockerfile ."
            }
        }

        stage('Test (optional)') {
            steps {
                echo "Running simple test (if any)..."
                // You might place test commands here. Since project has HTML + Dockerfile only, maybe skip or add a placeholder
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying container ${CONTAINER_NAME}"
                // stop and remove existing container if running
                sh """
                  docker stop ${CONTAINER_NAME} || true
                  docker rm ${CONTAINER_NAME} || true
                """
                // run new container
                sh "docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline finished successfully. Deployed ${IMAGE_NAME}:${IMAGE_TAG}"
        }
        failure {
            echo "❌ Pipeline failed."
        }
    }
}
