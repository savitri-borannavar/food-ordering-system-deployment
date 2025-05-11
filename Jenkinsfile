pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'savitrinb/food_ordering_system'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'your-jenkins-git-credential-id', url: 'https://github.com/savitri-borannavar/food-ordering-system-deployment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'You can add test commands here'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: '007643c0-9a20-4874-9b09-2a0926ff1d75', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }
    }
}
