pipeline
{
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "ap-south-1"
    
    }
    stages{
        stage('Git Checkout'){
            steps{
                script{
                    git branch:'main' ,url:'https://github.com/CKDevops01/EKS-Jenkins-Terraform.git'
        }
        }
        }
        stage('Initializing Terraform'){
            steps{
                script{
                    dir('EKS'){
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Formatting Terraform Code'){
            steps{
                script{
                    dir('EKS'){
                        sh 'terraform fmt'
                    }
                }
            }
        }
        stage('Validating Terraform'){
            steps{
                script{
                    dir('EKS'){
                        sh 'terraform validate'
                    }
                }
            }
        }
        stage('Previewing the Infra using Terraform'){
            steps{
                script{
                    dir('EKS'){
                        sh 'terraform plan'
                    }
                    input(message: "Are you sure to proceed?", ok: "Proceed")
                }
            }
        }
        stage('Creating/Destroying an EKS Cluster'){
            steps{
                script{
                    dir('EKS') {
                        sh 'terraform $action --auto-approve'
                    }
                }
            }
        }

        stage('Deploying Two-Tier-Web-Application') {
            steps{
                script{
                    dir('EKS/ConfigurationFiles') {
                        sh 'aws eks update-kubeconfig --name ck-eks-n8xtyAPU'
                        sh 'kubectl apply -f mysql-deployment.yml --validate=false'
                        sh 'kubectl apply -f mysql-configmap.yml'
                        sh 'kubectl apply -f mysql-secrets.yml'
                        sh 'kubectl apply -f mysql-svc.yml'
                        sh 'kubectl apply -f two-tier-app-deployment.yml'
                        sh 'kubectl apply -f two-tier-app-svc.yml'
                    }
                }
            }
        }

        
        
        

    


    }

}
