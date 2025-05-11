pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'savitrinb/serve_smart'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: '88f671b4-90a3-4083-bba4-37e02f273e33', url: 'https://github.com/savitri-borannavar/food-ordering-system-deployment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Test') {
            steps {
                echo 'You can add test commands here'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: '007643c0-9a20-4874-9b09-2a0926ff1d75', usernameVariable: 'savitrinb', passwordVariable: 'DOCKER_PASS')]) {
                    bat "echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin"
                    bat "docker push %DOCKER_IMAGE%"
                }
            }
        }

        stage('Cleanup') {
            steps {
                bat "docker rmi %DOCKER_IMAGE%"
            }
        }
    }
}
