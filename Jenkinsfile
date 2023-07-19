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
                sh 'docker build -t davitmadoyan/trg-task:1.0.7 .'
            }
        }
        stage('Login and Push') {
            steps {
                sh 'echo "dckr_pat_m0enQ8oTaOTT5UEFJBmkfJ2Wuj4" | docker login -u "davitmadoyan" --password-stdin'
                sh 'docker push davitmadoyan/trg-task:1.0.7'
            }
        }
        stage('Push changes') {
            steps {
                sh 'rm -rf trg-argocd-app-config'
                sh 'git clone https://github.com/davitmadoyan/trg-argocd-app-config.git'
                sh 'sed -i "s/trg-task:.*$/trg-task:1.0.7/g" trg-argocd-app-config/app-manifests/deployment.yml'
                sh 'cd trg-argocd-app-config; git add .; git commit -m "updated image version"; git push https://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@github.com/davitmadoyan/trg-argocd-app-config.git'
            }
        }
    }
}
