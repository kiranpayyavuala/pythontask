pipeline{
    agent any
    stages{
        stage('SCM'){
            steps{
                git credentialsId: 'github', url: 'https://github.com/kiranpayyavuala/pythontask'
            }
        }
}
}
