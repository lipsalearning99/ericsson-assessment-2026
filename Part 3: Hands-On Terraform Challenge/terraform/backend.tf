terraform {
  backend "s3" {
    bucket = "ericssion-assessment"
    key    = "lambda-container/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true # Enable S3 native locking
  }
}
