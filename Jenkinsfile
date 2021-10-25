node{

stage('Checkout')  {
	
 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'snehalgit', url: 'https://github.com/snehaljoshi0904/spring-unit-testing-with-junit-and-mockito.git']]])
  }


stage('Initial Setup'){

bat "C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn clean compile"
}
	
stage('SonarQube analysis') {
		withSonarQubeEnv(installationName: 'sonar') {			 
                    bat 'C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar -Dsonar.projectKey=spring-unit-testing-with-junit-and-mockito_New -Dsonar.organization=learning-cicd'
    		}	 	
        }
	
/*stage("Quality Gate"){
  timeout(time: 1, unit: 'HOURS') { 
    def qg = waitForQualityGate() 
    if (qg.status != 'OK') {
      error "Pipeline aborted due to quality gate failure: ${qg.status}"
    }
}
}*/


stage('Unit Testing'){

bat "C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn test"
}
}
