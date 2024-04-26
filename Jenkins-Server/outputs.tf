output "public-ip" {
  description = "public ip of instance"
  value       = module.ec2_instance.public_ip

}

output "private-ip" {
  description = "private ip of instance"
  value       = module.ec2_instance.private_ip
}

output "vpc-id" {
  description = "Vpc id"
  value       = module.vpc.vpc_id
}

output "sg-id" {
  description = "security group id"
  value       = module.sg.security_group_id
}