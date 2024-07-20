resource "aws_instance" "sandbox_bastion" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id     = aws_subnet.sandbox_public2.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.bastion_sg.id]
  depends_on = [
    aws_security_group.bastion_sg
  ]
  tags = {
    Name = "sandbox-bastion-host"
  }
}

resource "aws_instance" "sandbox_private" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id     = aws_subnet.sandbox_private1.id
  security_groups = [aws_security_group.private_instance_sg.id]
  depends_on = [
    aws_security_group.private_instance_sg
  ]
  tags = {
    Name = "sandbox-private-instance"
  }
}