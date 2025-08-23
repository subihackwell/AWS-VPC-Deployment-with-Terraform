output "ec2_public_ip" {
  description = "Public IP of the web server"
  value       = module.web_instance.public_ip
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = module.public_subnet.subnet_id
}
