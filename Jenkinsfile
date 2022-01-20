node{

stage('Checkout')  {
	
 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'gittest', url: 'https://github.com/snehaljoshi0904/spring-unit-testing-with-junit-and-mockito.git']]])
 }


}
