output "bastion_eip" {
  description = "The Elastic IP address assigned to the bastion host"
  value       = aws_eip.ec2_eip.public_ip
}

output "sandbox_private_ip" {
  description = "The private IP address of the sandbox host"
  value       = aws_instance.sandbox_private.private_ip
}