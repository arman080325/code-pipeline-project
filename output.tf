output "ec2_public_ip" {
  value = module.codedeploy.ec2_ip
}

output "pipeline_name" {
  value = module.codepipeline.name
}
