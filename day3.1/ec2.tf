resource "aws_instance" "sandbox" {
  ami           = "ami-0a0e5d9c7acc336f1" #Ubuntu Server 22.04 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[0].id
  associate_public_ip_address = true

  tags = {
    Name = "sandbox-server"
  }
}