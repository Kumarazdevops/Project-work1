pipeline {
    agent any
    stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch : 'main', url: 'https://github.com/Kumarazdevops/Project-work1.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("app:${env.BUILD_ID}")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        bat 'run-tests.sh'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dockerImage.push('app:latest')
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}
 
