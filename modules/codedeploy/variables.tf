variable "app_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "group_name" {
  description = "Name of the deployment group"
  type        = string
}

variable "role_arn" {
  description = "IAM role for CodeDeploy"
  type        = string
}

variable "instance_tag" {
  description = "EC2 instance tag to target deployment"
  type        = string
}
