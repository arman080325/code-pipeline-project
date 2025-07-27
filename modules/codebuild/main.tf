resource "aws_codebuild_project" "project" {
  name         = var.name
  service_role = var.role_arn      # IAM role for CodeBuild

  source {
    type      = "GITHUB"           # Can be GITHUB, CODECOMMIT, etc.
    location  = var.repo_url       # Complete GitHub repo URL
    buildspec = "buildspec.yml"    # Build commands to run
  }

  artifacts {
    type = "CODEPIPELINE"          # Output sent directly to CodePipeline
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL" # Build environment size
    image        = "aws/codebuild/standard:6.0"
    type         = "LINUX_CONTAINER"
  }
}
