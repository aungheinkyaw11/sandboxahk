resource "aws_subnet" "public" {
  count = 3

  vpc_id     = aws_vpc.sandboxahk_vpc.id
  cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index)

  tags = {
    Name = "public${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = 3

  vpc_id     = aws_vpc.sandboxahk_vpc.id
  cidr_block = cidrsubnet("10.0.16.0/20", 8, count.index)

  tags = {
    Name = "private${count.index + 1}"
  }
}
