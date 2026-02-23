# Table of Contents

# Part 1 - SAAS Architecture for React frontend + Python backend application on AWS

A static React app hosted in an S3 bucket with a CloudFront distribution in front of the website. The backend is running behind API Gateway, implemented as a Lambda function. Here, the application is fully downloaded to the client and rendered in a web browser. It sends requests to the backend.

## Solution Steps
1.  Create an Amazon S3 bucket and set it up for static website hosting
   
2.  Create DNS records in Amazon Route53

3.  Set up an Amazon CloudFront distribution and link it with a custom domain
   
4.  Secure the connection via SSL/UsersTLS and AWS Certificate Manager

## End-to-End Request Flow
1.  User loads site from **CloudFront**
    
2.  CloudFront pulls static files from **S3**
    
3.  React app makes HTTP request to **API Gateway**
    
4.  API Gateway triggers **Lambda**
    
5.  Lambda queries database and returns JSON
    
6.  React updates UI

