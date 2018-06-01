pipeline {
  agent any
  stages {
    stage('Checkout') {
      agent any
      steps {
        git(url: 'https://github.com/bnasslahsen/jenkins-sample-1.git', branch: 'master', credentialsId: 'git-login')
      }
    }
    stage('Compile') {
      agent any
      steps {
        withMaven(maven: 'MAVEN-3', jdk: 'JDK-8') {
          sh 'mvn clean compile'
        }

      }
    }
    stage('Package') {
      steps {
        withMaven(jdk: 'JDK-8', maven: 'MAVEN-3') {
          sh 'mvn package'
        }

      }
    }
  }
}