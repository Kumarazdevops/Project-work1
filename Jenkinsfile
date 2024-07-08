 pipeline {
    agent any

    stages {
      stage('clone'){
        steps{
          git branch : 'main', url: 'https://github.com/Kumarazdevops/project-work1.git'
        }
      }
        stage('Build') {
            steps {
                script {
                    docker.build('app:latest')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image('app:latest').inside {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repositories/sravankumar0338', 'docker-credentials') {
                        docker.image('app:latest').push('latest')
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
