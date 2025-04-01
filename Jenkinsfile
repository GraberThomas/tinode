pipeline {
    agent any  

    environment {
        IMAGE_NAME = 'openlab29/tinode'
        IMAGE_TAG = 'latest'
        DOCKER_HUB_CREDENTIALS = 'dockercred' // ID des credentials dans Jenkins
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: DOCKER_HUB_CREDENTIALS, variable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u mon-utilisateur --password-stdin"
                    }
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker stop mon-projet || true && docker rm mon-projet || true"
                    sh "docker run -d -p 3000:3000 --name mon-projet ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé'
        }
    }
}
