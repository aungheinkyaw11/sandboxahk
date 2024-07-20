#attach with IGW
resource "aws_route_table" "pubic_routetable" {
  vpc_id = aws_vpc.sandboxahk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sandbox_igw.id
  }

  tags = {
    Name = "sandbox_public_rt"
  }
}

#attach with NAT
resource "aws_route_table" "private_routetable" {
  vpc_id = aws_vpc.sandboxahk_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.sandbox_natgw.id
  }

  tags = {
    Name = "sandbox_private_rt"
  }
}

#associate with public subnets
resource "aws_route_table_association" "rtpublic1" {
  subnet_id      = aws_subnet.sandbox_public1.id
  route_table_id = aws_route_table.pubic_routetable.id
}

resource "aws_route_table_association" "rtpublic2" {
  subnet_id      = aws_subnet.sandbox_public2.id
  route_table_id = aws_route_table.pubic_routetable.id
}

#associate with private subnets
resource "aws_route_table_association" "rtprivate1" {
  subnet_id      = aws_subnet.sandbox_private1.id
  route_table_id = aws_route_table.private_routetable.id
}

resource "aws_route_table_association" "rtprivate2" {
  subnet_id      = aws_subnet.sandbox_private2.id
  route_table_id = aws_route_table.private_routetable.id
}