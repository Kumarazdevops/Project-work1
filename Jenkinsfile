 pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'clone https://github.com/Kumarazdevops/Project-work1.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    
                    sh 'docker build -t app .'
                    sh 'docker run -d --name app-dev -p 3000:3000 app'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        
                        
                        sh 'docker run -d --name app-test -p 3001:3000 app'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dockerImage.push('app:latest')
                    sh 'docker-compose up -d'
                    sh 'docker run -d --name app-prod -p 80:3000 app'
                    sh 'docker run -d --name app-dev -p 3000:3000 -v $(pwd)/data:/app/data app
                    sh 'docker network create app-network'
                    sh 'docker run -d --name app-dev --network app-network -p 3000:3000 app'
                    sh 'docker run -d --name db --network app-network -e POSTGRES_PASSWORD=mysecretpassword postgres'
'
                }
            }
        }
    }
}
