resource "aws_codedeploy_app" "app" {
  name             = var.app_name
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name               = aws_codedeploy_app.app.name
  deployment_group_name  = var.group_name
  service_role_arn       = var.role_arn

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = var.instance_tag
  }
}
