resource "aws_nat_gateway" "sandbox_natgw" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.sandbox_public1.id
  tags = {
    Name = "sandbox nat gw"
  }
  depends_on = [aws_internet_gateway.sandbox_igw]
}