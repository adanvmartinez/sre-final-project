
//Author: Adan Martinez
//Thus automates deployment of infrastructure using Jenkins.
pipeline{

    parameters {
        string(name: 'deploymentName', defaultValue: 'nginx-deployment', description: 'Pod Name')
        string(name: 'servicePort', defaultValue: '80', description: 'Port to listen on')
      }

    agent any
    
    stages{
        //Runs unit test apps
        stage("Test App"){
            steps{
                sh 'python3 app/testadan.py app/testindex.py'
                echo 'Ran tests...'
            }
        }
        //Checks for any formatting errors in terreform syntax
        stage('Terraform Format Check') {
            steps{
                dir('terraform'){
                sh 'pwd'
                sh 'terraform fmt'
                }
            }
        }
        //Initializes terraform files
        stage('Terraform Init') {
            steps{
                dir('terraform'){
                sh 'pwd'
                sh 'terraform init'
                }
            }
        }
        //Validate scripts
        stage('Terraform Validate') {
            steps{
                dir('terraform'){
                sh 'pwd'
                sh 'terraform validate'
                }
            }
        }
        //Make sure we have access to AWS and start terraform planning
        stage('Terraform Plan and Apply'){
            steps{
                withAWS(credentials:'aws-credentials',region:'us-west-1'){
                    dir('terraform'){
                    sh 'pwd'
                    sh 'aws iam list-users'
                    sh 'terraform plan -input=false -out tfplan'
                    //sh 'terraform show -no-color tfplan > tfplan.txt'
                    sh 'pwd'
                    sh 'ls -a'
                    sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
        //Build Docker image with the python app and nginx
         stage('Build NGINX-APP Docker Image'){
             steps{
                 echo 'building docker image ${params.deploymentName}'
                 
                 //Skipping this stage for now...
                 
                 //sh 'docker image rm adan/python-app'
                 //sh 'docker build . -t adan/python-app:python-app'


                 
                 //sh ''
                 //sh 'docker run --rm -p 5000:5000 app:latest &'
                 //sh 'eval $(minikube -p minikube docker-env)'
                //sh 'aws eks --region us-east-2 update-kubeconfig --name terraform-cluster'
                //sh 'kubectl apply -f app.yml'
                

                 
             }
         }

        //Deploy ngin-x image from repo
        stage('Deploy NGINx Image'){
            steps{
                withAWS(credentials:'aws-credentials',region:'us-west-1'){
                    echo "Deoploying ${params.deploymentName} ...."

                    // sh "kubectl create deployment ${params.deploymentName} --image=nginx --port=${params.servicePort}"


                    // echo "Exposing port ${params.servicePort} "
                    // sh "kubectl expose deployment ${params.deploymentName}  --type=ClusterIP  --name=nginx-service-cluster-ip"
                    // sh "kubectl expose deployment ${params.deploymentName}  --type=NodePort  --name=nginx-service-nodeport"
                    // sh "kubectl expose deployment ${params.deploymentName}  --type=LoadBalancer  --name=nginx-service-loadbalancer"

                    // sh 'kubectl get nodes'
                    // sh 'kubectl get pods --all-namespaces'
                  

                    //  sh 'kubectl get nodes'
                    //  sh 'kubectl get pods --output=wide'

                }
            }
        }
        //Display completion message
        stage('Complete'){
            steps{
                echo "Deployment successful!"
                echo "Pod Name: ${params.deploymentName}"
                echo "Service Name: ${params.servicePort}"
            }
        }  


        //Destoy infra
        stage('Destroy'){
            steps{
                withAWS(credentials:'bhagwat-aws',region:'us-east-2'){
                    dir('terraform'){
                        echo 'Destroy Stage'
                        sh 'terraform destroy --auto-approve'
                    }
                    
                }
            }
        }
    }
        
}
