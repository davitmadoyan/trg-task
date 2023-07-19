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
                sh 'docker build -t davitmadoyan/trg-task:1.0.5 .'
            }
        }
        stage('Login and Push') {
            steps {
                sh 'echo "dckr_pat_m0enQ8oTaOTT5UEFJBmkfJ2Wuj4" | docker login -u "davitmadoyan" --password-stdin'
                sh 'docker push davitmadoyan/trg-task:1.0.5'
            }
        }
        stage('Push changes') {
            steps {
                sh 'git config --global user.email "dmadoyan@example.com"'
                sh 'git config --global user.name dmadoyan'
                sh 'git clone https://github.com/davitmadoyan/trg-argocd-app-config.git'
                sh 'sed -i "s/trg-task:.*$/trg-task:1.0.5/g" trg-argocd-app-config/app-manifests/deployment.yml'
                sh 'cd trg-argocd-app-config; git add .; git commit -m "updated image version"; git push https://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@github.com/davitmadoyan/trg-argocd-app-config.git'
                sh 'rm -rf trg-argocd-app-config'
            }
        }
    }
}
