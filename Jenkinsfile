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
                sh 'docker build -t davitmadoyan/trg-task:1.0.4 .'
            }
        }
        stage('Login and Push') {
            steps {
                sh 'echo "dckr_pat_m0enQ8oTaOTT5UEFJBmkfJ2Wuj4" | docker login -u "davitmadoyan" --password-stdin'
                sh 'docker push davitmadoyan/trg-task:1.0.4'
            }
        }
        stage('Push changes') {
            steps {
                sh 'git clone https://github.com/davitmadoyan/trg-argocd-app-config.git temp'
                sh 'pwd'
                sh 'ls -la'
                sh 'cd temp/trg-argocd-app-config/'
                sh 'sed -i "s/trg-task:.*$/trg-task:1.0.4/g" deployment.yml'
                sh 'git add .'
                sh 'git commit -m "updated image version'
                sh 'git push'
                sh 'cd ../../'
                sh 'rm -rf temp'
            }
        }
    }
}
