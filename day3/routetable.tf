#attach with IGW
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.sandboxahk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "sandboxahk_public_rt"
  }
}

#subnet association with 3 public subnets
resource "aws_route_table_association" "rtpublic" {
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.routetable.id
  count = 3
}



#subnet association with 3 private subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.sandboxahk_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count         = length(aws_subnet.private)
  subnet_id     = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
