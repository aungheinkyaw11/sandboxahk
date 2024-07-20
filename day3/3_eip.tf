resource "aws_eip" "vpc_eip" {
  domain = "vpc"
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.sandbox_bastion.id
}