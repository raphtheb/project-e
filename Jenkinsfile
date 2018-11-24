#!groovy

pipeline {
  environment {
    registry = "localhost/nginx"
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/nginxinc/NGINX-Demos.git'
      }
    }
    stage('Build') {
       steps {
         sh 'cd nginx-hello; docker build --tag nginx:latest .'
       }
    }
    stage('Test') {
      steps {
        sh 'echo "Running tests here. Except this build has no tests."'
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
