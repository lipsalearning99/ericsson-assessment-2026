variable "lambda_name" {
  description = "Name of the AWS Lambda function"
  type        = string

  validation {
    condition     = length(var.lambda_name) > 0
    error_message = "Lambda name must not be empty."
  }
}

variable "ecr_image_uri" {
  description = "ECR image URI for the Lambda container image"
  type        = string

  # validation {
  #   condition     = can(regex("^\\d+\\.dkr\\.ecr\\..+\\.amazonaws\\.com\\/.+:.+$", var.ecr_image_uri))
  #   error_message = "ECR image URI must be a valid ECR image URI."
  # }
}

variable "vpc_id" {
  description = "VPC ID where the Lambda function will be deployed"
  type        = string

  validation {
    condition     = can(regex("^vpc-[a-z0-9]+$", var.vpc_id))
    error_message = "VPC ID must be a valid VPC ID (e.g., vpc-abc123)."
  }
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where Lambda will run"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) >= 2
    error_message = "Provide at least two private subnet IDs for high availability."
  }
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}

  validation {
    condition     = alltrue([for k, v in var.tags : length(k) > 0 && length(v) > 0])
    error_message = "All tag keys and values must be non-empty strings."
  }
}

variable "environment_variables" {
  description = "Non-sensitive environment variables for Lambda"
  type        = map(string)
  default     = {}

  validation {
    condition     = alltrue([for k, v in var.environment_variables : length(k) > 0 && length(v) > 0])
    error_message = "Environment variable keys and values must be non-empty strings."
  }
}
