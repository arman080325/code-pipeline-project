output "app_name" {
  value = aws_codedeploy_app.app.name
}

output "group_name" {
  value = aws_codedeploy_deployment_group.group.deployment_group_name
}

output "ec2_ip" {
  value = aws_instance.web.public_ip
  description = "The public IP of the EC2 instance for testing"
  # Optional: Only include this if EC2 instance is provisioned in this module.
}
