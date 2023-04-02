pipeline{
    agent any
    stages{
        stage('SCM'){
            steps{
                git credentialsId: 'github', url: 'https://github.com/kiranpayyavuala/pythontask'
            }
        }
        stage('Docker Build'){
            steps{
                sh "docker build . -t 947403847382.dkr.ecr.ap-south-1.amazonaws.com/pythonnium:latest "
            }
        }		
}
}
