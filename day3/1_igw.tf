resource "aws_internet_gateway" "sandbox_igw" {
  vpc_id = aws_vpc.sandboxahk_vpc.id

  tags = {
    Name = "sandboxahk_igw"
  }
}