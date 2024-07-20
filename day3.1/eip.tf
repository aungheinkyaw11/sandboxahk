resource "aws_eip" "sandboxeip" {
  domain   = "vpc"
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.sandbox.id
}