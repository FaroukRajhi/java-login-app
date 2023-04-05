pipeline{
    agent any
    
    
    stages {
        
        // Condition throught the stages
        
        
        stage('SCM Checkout'){
            
            steps {
                git branch: 'main', url: 'https://github.com/FaroukRajhi/java-login-app.git'
            }
        }
        
        stage('Unit Test maven'){

            steps {
                sh 'mvn test'
            }
        }
        
        stage('Maven integration Test'){

            steps {
                
                sh 'mvn verify -DskipUnitTests'
            }
        }
        
        stage('Static code analysis'){
            steps {
                
                withSonarQubeEnv(credentialsId: 'sq1', installationName: 'sq1') {
                  sh 'mvn clean package sonar:sonar'
                }
            }
        }
        
        stage('maven Build'){
            
            steps{
               
               sh ' mvn clean install' 
                
            }
        }
        
        stage('Docker Build Image'){
            
            steps {
                
                sh 'docker build -t farouk90/java-login:${BUILD_NUMBER} .'
            }
        }
        
        stage('Docker Login'){
            
            steps{
                
                withCredentials([string(credentialsId: 'dockerHub', variable: 'DockerHub')]) {
                 sh 'docker login -u farouk90 -p ${DockerHub}'
                }
            }
        }
        stage('Docker image scan'){
            
            steps{
                sh 'trivy image farouk90/java-login:${BUILD_NUMBER} > scan.txt'
            }
        }
        
        stage('Push docker image'){
            
            steps{
                
                sh ' docker push farouk90/java-login:${BUILD_NUMBER} '
            }
        }
        

        
    }
}
