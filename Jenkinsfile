  pipeline {
    agent any

    stages {
      stage('clone){
            steps{
              git clone : 'main', url: 'https://github.com/Kumarazdevops/project-work1.git'
            }
      }
        stage('Build') {
            steps {
                script {
                    docker.build('myapp:latest')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image('myapp:latest').inside {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repositories/sravankumar0338', 'docker-credentials') {
                        docker.image('myapp:latest').push('latest')
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
