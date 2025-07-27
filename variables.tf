variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for storing CodePipeline artifacts"
  type        = string
}

variable "github_owner" {
  description = "GitHub user or organization name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "Branch to track in GitHub repository"
  type        = string
  default     = "main"
}

variable "github_token" {
  description = "GitHub personal access token to allow AWS CodePipeline access"
  type        = string
  sensitive   = true
}
