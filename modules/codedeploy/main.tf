resource "aws_codedeploy_app" "app" {
  name             = var.app_name
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = var.group_name
  service_role_arn      = var.role_arn

  deployment_style {
    deployment_type   = "BLUE_GREEN"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  load_balancer_info {
    target_group_info {
      name = var.target_group_name
    }
  }

  blue_green_deployment_config {
    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }

    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }
  }

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = var.instance_tag
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  deployment_config_name = "CodeDeployDefault.OneAtATime"
}
