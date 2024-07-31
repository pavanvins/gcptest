
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/pavanvins/gcptest.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=plan.out'
            }
        }
        stage('Manual Approval') {
            steps {
                input message: 'Approve Terraform Apply?', ok: 'Apply', submitter: 'Anyone'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply plan.out'
            }
        }
        stage('Destroy') {
            steps {
                input message: 'Approve Terraform Destroy?', ok: 'Destroy', submitter: 'Anyone'
            }
        }
        stage('Terraform Destroy') {
            steps {
                sh 'terraform destroy'
            }
        }
    }
}
