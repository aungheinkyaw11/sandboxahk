output "instance_id" {
  value = aws_instance.myinstance.id
}

output "instance_public_ip" {
  value = aws_instance.myinstance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.myinstance.private_ip
}
