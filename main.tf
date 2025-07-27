provider "aws" {
  region = var.aws_region
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "iam" {
  source = "./modules/iam"
}

module "codebuild" {
  source        = "./modules/codebuild"
  name          = "MyCodeBuildProject"
  role_arn      = module.iam.codebuild_role_arn
  repo_url      = "https://github.com/${var.github_owner}/${var.github_repo}"
}

module "codedeploy" {
  source       = "./modules/codedeploy"
  app_name     = "MyApp"
  group_name   = "MyDeploymentGroup"
  role_arn     = module.iam.codedeploy_role_arn
  instance_tag = "CodeDeployTarget"
  target_group_name = "MY-TARGET-GP"
}

module "codepipeline" {
  source             = "./modules/codepipeline"
  name               = "MyPipeline"
  role_arn           = module.iam.codepipeline_role_arn
  artifact_bucket    = module.s3.bucket_name
  github_owner       = var.github_owner
  github_repo        = var.github_repo
  github_branch      = var.github_branch
  github_token       = var.github_token
  build_project_name = module.codebuild.project_name
  codedeploy_app     = module.codedeploy.app_name
  codedeploy_group   = module.codedeploy.group_name
  pipeline_role_arn = var.pipeline_role_arn

}