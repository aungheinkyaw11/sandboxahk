resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.sandboxeip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "sandbox nat gw"
  }

  depends_on = [aws_internet_gateway.gw]
}