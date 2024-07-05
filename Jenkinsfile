 pipeline {
    agent any

  
    stages {
        stage('Clone Repository') {
            steps {
                git branch : 'main', url:'https://github.com/Kumarazdevops/Project-work1.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t aap .'
                    sh 'docker run -d --name app-dev -p 3000:3000 app'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'docker run -d --name app-test -p 3001:3000 app.sh'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dockerImage.push('app:latest')
                    sh 'docker run -d --name app-prod -p 80:3000 app'
                }
            }
        }
    }
}
