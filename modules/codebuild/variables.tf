variable "name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN that CodeBuild assumes"
  type        = string
}

variable "repo_url" {
  description = "The GitHub repository URL"
  type        = string
}
