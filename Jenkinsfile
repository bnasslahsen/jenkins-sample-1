// Powered by Infostretch 

timestamps {

node () {

	stage ('App-IC - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-login', url: 'https://github.com/bnasslahsen/jenkins-sample-1.git']]]) 
	}
	stage ('App-IC - Build') {
 			// Maven build step
	withMaven(maven: 'maven') { 
 			if(isUnix()) {
 				sh "mvn clean package " 
			} else { 
 				bat "mvn clean package " 
			} 
 		} 
	}
	
	stage ('APP-IC - Quality Analysis') {
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn sonar:sonar" 
			} else { 
 				bat "mvn sonar:sonar" 
			} 
 		} 
}

stage ('APP-IC - Deploy') {
	withMaven(maven: 'maven-3.5.4') { 
 			if(isUnix()) {
 				sh "mvn deploy" 
			} else { 
 				bat "mvn deploy" 
			} 
 		} 
}
	
}
}
