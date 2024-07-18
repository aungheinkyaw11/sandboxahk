resource "aws_vpc" "sandboxahk_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "sandboxahk_vpc"
  }
}