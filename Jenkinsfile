node{

stage('Checkout')  {
	
 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'snehalgit', url: 'https://github.com/snehaljoshi0904/spring-unit-testing-with-junit-and-mockito.git']]])
 }


stage('Initial Setup'){

bat "C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn clean compile"
}
	
stage('Unit Testing'){

bat "C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn test"

}
	
stage('Code Coverage'){
 bat 'C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn package'
}
	
stage('Code security scan'){
 bat 'C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn findbugs:findbugs'
}
	
stage('Code Quality analysis') {
  withSonarQubeEnv(installationName: 'sonar') {			 
  bat 'C:\\apache-maven-3.6.0-bin\\apache-maven-3.6.0\\bin\\mvn sonar:sonar -Dsonar.projectKey=spring-unit-testing-with-junit-and-mockito_New -Dsonar.organization=learning-cicd'
    }	 	
 }
	
	stage('Docker file scan') {
		bat 'C:\\devops\\terrascan_1.11.0_Windows_x86_64\\terrascan scan --iac-type docker'
	}
	
stage("Quality Gate"){
  timeout(time: 1, unit: 'HOURS') { 
    def qg = waitForQualityGate() 
    if (qg.status != 'OK') {
      error "Pipeline aborted due to quality gate failure: ${qg.status}"
    }
}
}	
	
}
