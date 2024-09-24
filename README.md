# Coworking Space Service Extension
The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space. This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another.

For this project, you are a DevOps engineer who will be collaborating with a team that is building an API for business analysts. The API provides business analysts basic analytics data on user activity in the service. The application they provide you functions as expected locally and you are expected to help build a pipeline to deploy it in Kubernetes.

## Getting Started

### Dependencies
#### Local Environment
1. Python Environment - run Python 3.6+ applications and install Python dependencies via `pip`
2. Docker CLI - build and run Docker images locally
3. `kubectl` - run commands against a Kubernetes cluster
4. `helm` - apply Helm Charts to a Kubernetes cluster

#### Remote Resources
1. AWS CodeBuild - build Docker images remotely
2. AWS ECR - host Docker images
3. Kubernetes Environment with AWS EKS - run applications in k8s
4. AWS CloudWatch - monitor activity and logs in EKS
5. GitHub - pull and clone code


## Project Instructions
1. Set up a Postgres database with a Helm Chart
2. Create a `Dockerfile` for the Python application. Use a base image that is Python-based.
3. Write a simple build pipeline with AWS CodeBuild to build and push a Docker image into AWS ECR
4. Create a service and deployment using Kubernetes configuration files to deploy the application
5. Check AWS CloudWatch for application logs

### Deliverables
1. `Dockerfile`
    ![docker](./screenshots/dockerfile.png)

2. Screenshot of AWS CodeBuild pipeline
    ![coldbuild](./screenshots/codebuild-1.png)
    ![coldbuild](./screenshots/codebuild-2.png)

3. Screenshot of AWS ECR repository for the application's repository
    ![ecr](./screenshots/ecr.png)
4. Screenshot of `kubectl get svc`
    ![svc](./screenshots/svc.png)
5. Screenshot of `kubectl get pods`
    ![svc](./screenshots/pods.png)
6. Screenshot of `kubectl describe svc <DATABASE_SERVICE_NAME>`
    ![database](./screenshots/describe-svc.png)
    ![service](./screenshots/deployment_coworking.png)
7. Screenshot of `kubectl describe deployment <SERVICE_NAME>`
    ![service](./screenshots/describe-coworking.png)
    
8. All Kubernetes config files used for deployment (ie YAML files)
    ![service](./screenshots/configmap-yaml.png)
    ![service](./screenshots/deployment.png)
    ![service](./screenshots/secret.png)
    ![service](./screenshots/service.png)



9. Screenshot of AWS CloudWatch logs for the application

    ![cloudwatch](./screenshots/cloudwatch.png)


10. `README.md` file in your solution that serves as documentation for your user to detail how your deployment process works and how the user can deploy changes. The details should not simply rehash what you have done on a step by step basis. Instead, it should help an experienced software developer understand the technologies and tools in the build and deploy process as well as provide them insight into how they would release new builds.

link : 

http://a746bd7d0cff743898bd3e9da39e9979-488595673.us-east-1.elb.amazonaws.com:5153/api/reports/daily_usage
http://a746bd7d0cff743898bd3e9da39e9979-488595673.us-east-1.elb.amazonaws.com:5153/api/reports/user_visits

![api](./screenshots/link.png)


#### Project Structure
```shell

├── CODEOWNERS
├── LICENSE.txt
├── README.md
├── analytics
│   ├── Dockerfile
│   ├── __init__.py
│   ├── app.py
│   ├── config.py
│   └── requirements.txt
├── buildspec.yml
├── db
│   ├── 1_create_tables.sql
│   ├── 2_seed_users.sql
│   └── 3_seed_tokens.sql
├── deployment
│   ├── configmap.yaml
│   ├── coworking.yaml
|   ├── postgresql-deployment.yaml
|   ├── postgresql-secret.yaml
|   ├── postgresql-service.yaml
|   ├── pv.yaml
|   ├── pvc.yaml
│   └── secret.yaml
├── deployment-local
│   ├── configmap.yaml
│   └── coworking.yaml
├── screenshots
│   ├── api.png
│   ├── api1.png
│   ├── api2.png
│   ├── api3.png
│   ├── cloudwatch.png
│   ├── codebuild.png
│   ├── codebuild1.png
│   ├── describe_deployment.png
│   ├── describe_svc.png
│   ├── describe_svc1.png
│   ├── ecr.png
│   ├── get_deployment.png
│   └── logs.png
└── scripts
    ├── create_cluster.sh
    ├── create_ecr.sh
    ├── create_helm.sh
    └── delete_cluster.sh