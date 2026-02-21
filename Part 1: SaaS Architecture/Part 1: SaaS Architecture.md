# Part 1: SaaS Architecture
This diagram shows the container orchestration layer, a container registry, how the React frontend is delivered to users, how it communicates with the Python API, and how all underlying AWS services interact.


# 🔄 End-to-End Request Flow

1.  User loads site from **CloudFront**
    
2.  CloudFront pulls static files from **S3**
    
3.  React app makes HTTP request to **API Gateway**
    
4.  API Gateway triggers **Lambda**
    
5.  Lambda queries database and returns JSON
    
6.  React updates UI

A static React app hosted in an S3 bucket with a CloudFront distribution in front of the website. The backend is running behind API Gateway, implemented as a Lambda function. Here, the application is fully downloaded to the client and rendered in a web browser. It sends requests to the backend.
