# Adan Martinez sre-final-project
Final project combining all subjects learned throughout the course 




## DevOps Lifecycle with AWS
In this project, you’ll be creating the infra using terraform and will perform application/tool stack configuration using shell scripts and will effectively use Jenkins for running automated CICD for both the application and infra deployment.

Provisioning a managed EKS cluster and setting up a mutable environment setup which ensures the HA and Resilience of the application.

Post-Mortem SRE Scoped Project: Install and configure the monitoring tool stack (Splunk and Dynatrace) to monitor the Application and Infra which is very essential for every production software system.

### Goals:
* Create infrastructure using terraform [ managed EKS cluster ]

* Use Jenkins to run automated CICD for the application  

* Set up Dynatrace and Splunk to monitor the application

* Make it all highly portable


## Setting up EC2 Instance for Jenkins
Create an EC2 for the CICD 

Add the inbound rules TCP 80 for the EC2 security group

Install NGINX and reverse proxy forward traffic from port 80 to localhost port 8080

## Settting up Jenkins on the EC2
```
$ sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \ /usr/share/keyrings/jenkins-keyring.asc > /dev null
$ sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \ https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
 /etc/apt/sources.list.d/jenkins.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install fontconfig openjdk-11-jre
$ sudo apt-get install jenkins
```  


To view the password needed to login

```
$ sudo cat  /var/lib/jenkins/secrets/initialAdminPassword
```  
Load the page on EC2 instalve public IP to access the Jenkins panel

Once the account was set up, I created linked the pipeline to a Github repository and set the project to be built by Github hook trigger for GITScm polling.  
After that, I triggerd a webhook on Github to be sent to jenkinsurl/<pipeline name> so that the project will be rebuilt every time ofter every commit to the Github repository.

<!-- Step 3 - Set up Splunk on the EC2
$ wget -O splunk-9.0.0.1-9e907cedecb1-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.0.1/linux/splunk-9.0.0.1-9e907cedecb1-Linux-x86_64.tgz"
$ sudo mv splunk-9.0.0.1-9e907cedecb1-Linux-x86_64.tgz /opt
$ cd /opt
$ sudo tar -xvzf splunk-9.0.0.1-9e907cedecb1-Linux-x86_64.tgz
$ sudo /opt/splunk/bin/splunk start
I configured splunk to not warn about the minimum disk space for this lab

$ sudo vi /opt/splunk/etc/system/local/server.conf
edit this file by adding these lines to the end -->

<!-- [diskUsage]
minFreeSpace = 50
Then I restarted the service

$ sudo /opt/splunk/bin/splunk restart
Now visit port 8000 on the public IP to access the Splunk panel -->

<!-- Installing Additional Dependencies And Configuration
Install git

$ sudo yum install git -y
Install docker

$ sudo yum install docker -y
$ sudo systemctl enable docker.service
$ sudo systemctl start docker.service
Install Kubectl

$ curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
$ chmod +x ./kubectl
$ mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
$ echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
$ kubectl version --short --client
Install terraform

$ sudo wget https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip
$ sudo unzip terraform_1.2.7_linux_amd64.zip
$ sudo mv terraform /usr/local/bin/
$ terraform version
Authenticating Kubectl

$ aws configure
$ aws eks --region us-east-1 update-kubeconfig --name EKS-Cluster
Note: I have learned its important to use the same IAM user used for terraform that is used for the authentication of kubectl or it will result in an access denied message. This is something I did that was improved from my previous labs. -->

## Running the Jenkins pipeline and Terraform
To create the infrastructure, the process was broken down into multiple terraform files for readability.


For this project, an existing NGINX image was used from the online repostory.

The pipeline runs the following commands to start the service

```
kubectl create deployment app-deployment --image=nginx --port=80 --dry-run=client -o yaml > nginx-deploy.yaml
kubectl apply -f nginx-deploy.yaml
kubectl expose deployment app-deployment  --type=ClusterIP  --name=app-service-cluster-ip
kubectl expose deployment app-deployment  --type=NodePort  --name=app-service-nodeport
kubectl expose deployment app-deployment  --type=LoadBalancer  --name=app-service-loadbalancer
```


## Setting up the Monitoring Tool Stack
For connecting the EKS cluster to monitoring, the following was done

Open up the cloud shell Connect to the EKS created

```
aws eks --region us-east-2 update-kubeconfig --name <my cluster name>
```

For Connecting Splunk to the webserver

Working on it...
