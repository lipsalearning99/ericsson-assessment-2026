# Part 2: CICD Blueprint
Three CICD pipelines required.


2. CICD pipeline to maintain frontend react SPA - Every code push to remote repo will trigger pipeline to push the updated application to S3 bucket
3. CICD pipeline to maintain the - Every code push to remote repo will trigger pipeline to build a new docker images from updated python code, push to ECR repository, and re deploy the lambda functions with the new container.


**1️⃣ CI/CD Pipeline – Infrastructure (IaC → AWS)**
   
**Goal** : Every push to the infra repo updates AWS infrastructure automatically.

**Recommended Stack**:

- IaC Tool: Terraform or AWS CloudFormation

- CI/CD: AWS CodePipeline or GitHub Actions

- Build stage: AWS CodeBuild

- State storage (Terraform): S3

**Architecture Flow** : Git Push → CodePipeline → CodeBuild → terraform plan → manual approval (optional, but recommended for prod) → terraform apply → AWS updated

**2️⃣ CI/CD Pipeline – React SPA → S3**
   
**Goal** : Push to repo → Build React app → Deploy static files to S3

**Recommended Stack**:

- IaC Tool: Terraform or AWS CloudFormation

- CI/CD: AWS CodePipeline or GitHub Actions

- Build stage: AWS CodeBuild

- State storage (Terraform): S3

**Architecture Flow** : Git Push → CodePipeline → CodeBuild (npm build) → Upload to S3 → Invalidate CloudFront





# Complete CI/CD Architecture Overview

code```
                ┌──────────────┐
                │   GitHub     │
                └──────┬───────┘
                       │
        ┌──────────────┼──────────────┐
        │              │              │
   Infra Pipeline   Frontend CI   Backend CI
        │              │              │
   Terraform Apply   Build React   Build Docker
        │              │              │
     AWS Updated      S3 + CF      ECR → Lambda
```





