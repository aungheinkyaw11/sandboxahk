resource "aws_vpc" "sandboxahk_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "sandboxahk_vpc"
  }
}