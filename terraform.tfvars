# AWS Region
aws_region = "us-east-1"

# S3 Bucket for Artifact Storage
bucket_name = "code-pipeline-project-bucket"

# GitHub Configuration
github_owner  = "arman080325"
github_repo   = "code-pipeline-project"
github_branch = "main"

# GitHub Personal Access Token (Make sure this has repo and admin:repo_hook access)
# github_token = "REDACTED"  # moved to environment variable
target_group_name = "MY-TARGET-GP"
pipeline_role_arn = "arn:aws:iam::095329250914:role/codepipelinefull"
