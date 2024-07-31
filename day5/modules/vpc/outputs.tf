output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.myvpc.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.myvpc.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

# output "public_subnet_cidrs" {
#   value = aws_subnet.public[*].cidr_block
# }