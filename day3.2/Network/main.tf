# VPC
resource "aws_vpc" "sandboxahk_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.vpcname}"
  }
}

#IGW
resource "aws_internet_gateway" "sandbox_igw" {
  vpc_id = aws_vpc.sandboxahk_vpc.id
  depends_on = [ aws_vpc.sandboxahk_vpc ]
  tags = {
    Name = "${var.igw}"
  }
}

#EIP
resource "aws_eip" "vpc_eip" {
  domain = "vpc"
  depends_on = [ aws_internet_gateway.sandbox_igw ]
}


#NAT GW
resource "aws_nat_gateway" "sandbox_natgw" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.sandbox_public1.id
  tags = {
    Name = "${var.natgw-name}"
  }
}

#SUBNETS
resource "aws_subnet" "sandbox_public1" {
  vpc_id            = aws_vpc.sandboxahk_vpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "sandbox_public1"
  }
}

resource "aws_subnet" "sandbox_public2" {
  vpc_id            = aws_vpc.sandboxahk_vpc.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "sandbox_public2"
  }
}

resource "aws_subnet" "sandbox_private1" {
  vpc_id            = aws_vpc.sandboxahk_vpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "sandbox_private1"
  }
}

resource "aws_subnet" "sandbox_private2" {
  vpc_id            = aws_vpc.sandboxahk_vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "sandbox_private2"
  }
}

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

