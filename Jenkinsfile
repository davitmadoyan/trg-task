pipeline {
    agent any
    environment {
        GH_TOKEN = credentials('gh-token')
    }
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
<<<<<<< HEAD
                sh 'cd trg-argocd-app-config; git add .; git commit -m "updated image version"; git push https://${GH_TOKEN}@github.com/davitmadoyan/trg-argocd-app-config.git'
=======
                sh 'cd trg-argocd-app-config; git add .; git commit -m "updated image version"; git push https://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@github.com/davitmadoyan/trg-argocd-app-config.git'
>>>>>>> e89a065e7b110b2da3b4303ccfe1918a4ec7c8ae
            }
        }
    }
}
