 pipeline {
    agent any

    stages {
      stage('clone'){
        steps{
          git branch : 'main', url: ''
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
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-credentials') {
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
