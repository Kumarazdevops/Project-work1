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
                    
                    sh 'docker build -t myapp .'
                    sh 'docker run -d --name cont1.1 -p 8033:80 myapp'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        
                        
                        sh 'docker run -d --name cont1.1test -p 8034:80 app'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dockerImage.push('app:latest')
                    sh 'docker-compose up -d'
                    sh 'docker run -d --name app-prod -p 80:3000 myapp'
                    sh 'docker run -d --name cont1.1 -p 3000:3000 -v /data:/app/data app
                    sh 'docker network create app-network'
                    sh 'docker run -d --name cont1.1 --network app-network -p 3000:3000 app'
                    
'
                }
            }
        }
    }
}
