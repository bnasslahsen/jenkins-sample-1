// Powered by Infostretch 

timestamps {

node () {

	stage ('Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-login', url: 'https://github.com/bnasslahsen/jenkins-sample-1.git']]]) 
	}
	stage ('Clean') {
 			//  build step
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn clean " 
			} else { 
 				bat "mvn clean " 
			} 
 		}		// Maven build step
	}
	stage ('Compile') {
 			// Maven build step
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn compile " 
			} else { 
 				bat "mvn compile " 
			} 
 		}		// Maven build step
	}
	
	stage ('Test') {
 			// Maven build step
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn test " 
			} else { 
 				bat "mvn test " 
			} 
 		}		// Maven build step
	}
	
	stage (' Quality analysis') {
 				// Maven build step
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn sonar:sonar " 
			} else { 
 				bat "mvn sonar:sonar " 
			} 
 		}
	}
	stage ('Package') {
 			// Maven build step
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn package " 
			} else { 
 				bat "mvn package " 
			} 
 		}		// Maven build step
	}
	stage ('Reporting') {
		junit '**/target/surefire-reports/*.xml' 
	}
}
}
