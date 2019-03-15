// Powered by Infostretch 

timestamps {

node () {

	stage ('Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-login', url: 'https://github.com/bnasslahsen/jenkins-sample-1.git']]]) 
	}
}
}
