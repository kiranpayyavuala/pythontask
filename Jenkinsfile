pipeline {
 agent any
 environment {
 AWS_ACCOUNT_ID="947403847382"
 AWS_DEFAULT_REGION="ap-south-1" 
 IMAGE_REPO_NAME="pythonnium"
 IMAGE_TAG="latest"
 REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
 }
 
 stages {
 
 stage('Logging into AWS ECR') {
 steps {
 script {
 sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 947403847382.dkr.ecr.ap-south-1.amazonaws.com"
 }
 
 }
 }
 // clone the repo
 stage('Cloning Git') {
            steps{
                git credentialsId: 'github', url: 'https://github.com/kiranpayyavuala/pythontask'
            }
        }
 // Building Docker images
 stage('Building image') {
 steps{
 script {
 dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
 }
 }
 }
  // Uploading Docker images into AWS ECR
 stage('Pushing to ECR') {
 steps{ 
 script {
 sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
 sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
 }
 }
 }
 }
 }

