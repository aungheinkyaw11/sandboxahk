output "vpcid" {
  value = aws_vpc.sandboxahk_vpc.id
}

output "privatesubnet1" {
  value = aws_subnet.sandbox_private1.id
}