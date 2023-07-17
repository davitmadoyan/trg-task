pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trg-task/1.0.0 .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo "dckr_pat_m0enQ8oTaOTT5UEFJBmkfJ2Wuj4" | docker login -u "davitmadoyan" --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push trg-task/1.0.0'
            }
        }
    }
}
