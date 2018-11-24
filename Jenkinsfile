#!groovy

pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/nginxinc/NGINX-Demos/tree/master/nginx-hello'
      }
    }
    stage('Build') {
       steps {
         sh 'docker build .'
       }
    }
    stage('Test') {
      steps {
        sh 'echo "Running tests here."'
      }
    }
    stage('Building image') {
      steps{
        script {
          sh 'echo "This should fail."'
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
