output "vpcid" {
  value = aws_vpc.sandboxahk_vpc.id
}

output "privatesubnet1" {
  value = aws_subnet.sandbox_private1.id
}

output "publicsubnet2" {
  value = aws_subnet.sandbox_private2.id  
}

output "sandbox_public1" {
  value = aws_subnet.sandbox_public1.id  
}
output "sandbox_public2" {
  value = aws_subnet.sandbox_public2.id
}