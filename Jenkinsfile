#!groovy

pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git ‘https://github.com/karthequian/docker-helloworld'
      }
    }
    stage('Build') {
       steps {
         sh ‘docker build .’
       }
    }
    stage('Test') {
      steps {
        sh ‘echo "Running tests here."’
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + “:$BUILD_NUMBER”
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
