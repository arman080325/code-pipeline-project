variable "name" {}
variable "role_arn" {}
variable "artifact_bucket" {}

variable "github_owner" {}
variable "github_repo" {}
variable "github_branch" {}
variable "github_token" {}

variable "build_project_name" {}
variable "codedeploy_app" {}
variable "codedeploy_group" {}
variable "pipeline_role_arn" {
  description = "IAM role ARN for CodePipeline (manually created)"
  type        = string
}
