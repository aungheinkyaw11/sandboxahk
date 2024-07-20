resource "aws_subnet" "sandbox_public1" {
  vpc_id     = aws_vpc.sandboxahk_vpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "sandbox_public1"
  }
}

resource "aws_subnet" "sandbox_public2" {
  vpc_id     = aws_vpc.sandboxahk_vpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "sandbox_public2"
  }
}

resource "aws_subnet" "sandbox_private1" {
  vpc_id     = aws_vpc.sandboxahk_vpc.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = var.availability_zone_a
  tags = {
    Name = "sandbox_private1"
  }
}

resource "aws_subnet" "sandbox_private2" {
  vpc_id     = aws_vpc.sandboxahk_vpc.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = var.availability_zone_b
  tags = {
    Name = "sandbox_private2"
  }
}