pipeline {
  agent any
  environment {
    IMAGE_VERSION = '1.0.8'
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t davitmadoyan/trg-task:$IMAGE_VERSION .'
      }
    }
    stage('Login and Push') {
      steps {
        sh 'echo "dckr_pat_m0enQ8oTaOTT5UEFJBmkfJ2Wuj4" | docker login -u "davitmadoyan" --password-stdin'
        sh 'docker push davitmadoyan/trg-task:$IMAGE_VERSION'
      }
    }
    stage('Push changes') {
      steps {
        script {
          withCredentials([
            string(
              credentialsId: 'gh-token',
              variable: 'GH_TOKEN')
          ]) {
            sh 'rm -rf trg-argocd-app-config'
            sh 'git clone https://github.com/davitmadoyan/trg-argocd-app-config.git'
            sh 'sed -i "s/trg-task:.*$/trg-task:$IMAGE_VERSION/g" trg-argocd-app-config/app-manifests/deployment.yml'
            sh 'cd trg-argocd-app-config; git add .; git commit -m "updated image version"; git push https://$GH_TOKEN@github.com/davitmadoyan/trg-argocd-app-config.git'
          }
        }
      }
    }
  }
}
