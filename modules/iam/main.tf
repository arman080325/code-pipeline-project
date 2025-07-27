# CodeBuild Role
resource "aws_iam_role" "codebuild_role" {
  name = "codebuild_service_role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume.json
}

# CodePipeline Role
resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline_service_role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume.json
}

# CodeDeploy Role
resource "aws_iam_role" "codedeploy_role" {
  name = "codedeploy_service_role"
  assume_role_policy = data.aws_iam_policy_document.codedeploy_assume.json
}
