variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "ecr_image_uri" {
  description = "ECR image URI for Lambda container"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where Lambda will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for Lambda"
  type        = list(string)
}

variable "environment_variables" {
  description = "Environment variables for Lambda"
  type        = map(string)
  default     = {}
}

variable "lambda_memory_size" {
  description = "Memory size for Lambda"
  type        = number
  default     = 512
}

variable "lambda_timeout" {
  description = "Timeout for Lambda"
  type        = number
  default     = 900
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}