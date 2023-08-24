# Devops project overview
Deploying a django app on EKS. Techs used: AWS (RDS, ECR, EKS, ALB), Docker, Django, Terraform, Kubernetes, Helm, Jenkins, Jira.

## Steps executed
- Developed a django app that saves the clients' ip addresses in MySQL database (SQLITE3 locally) and clients can view the ip addresses of all the clients visited the website with the date they visited it but without duplication (just the first visit)

- Dockerized the django app using Docker and Docker compose

- Created Jenkins pipeline that pulls the app source code from GitHub, builds the Docker image and published the image to AWS ECR (Docker Hub for local tests)

- Provisioned AWS resources (RDS, ECR, EKS, ALB) using Terraform as well as managing Kubernetes and Helm releases by Terraform

- Created Helm charts that manages Kubernetes clusters to be deployed on AWS EKS

- Deployed the django app on EKS after changing all necessary databases and Docker images registry (from locally SQLITE3 to MySQL and from Docker Hub to AWS ECR)

## Usage
### For Terraform
Put your tfvars file with your values and put Helm values in values.yaml file and then execute:
```
terraform init
terraform plan
terraform apply --auto-approve
```

