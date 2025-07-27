resource "aws_codebuild_project" "project" {
  name         = var.name
  service_role = var.role_arn

  source {
    type      = "CODEPIPELINE"       # must be this when integrated with CodePipeline
    buildspec = "buildspec.yml"
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:6.0"
    type         = "LINUX_CONTAINER"
  }
}
