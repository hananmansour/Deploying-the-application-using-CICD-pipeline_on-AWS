#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERCREDENTIAL = credentials('DockerHub')
        AWS_DEFAULT_REGION = "us-east-2"
        
    }
    stages {
        stage("build docker file and push image to docker hub") {
            steps {
                script {
                    dir('app') {

                         
                    sh   'echo $DOCKERCREDENTIAL_PSW | docker login -u $DOCKERCREDENTIAL_USR -password-stdin   '
                    sh   'docker build -t 12345676700/fixed:v${BUILD_NUMBER} . '
                    sh   'docker push 12345676700/fixed:v${BUILD_NUMBER}'
                                
                        
                    }
                }
            }
        }
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f nginx-deployment.yaml"
                        sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}
