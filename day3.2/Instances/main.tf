resource "aws_instance" "sandbox_bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.sandbox_public2.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.bastion_sg.id]
  depends_on = [
    aws_security_group.bastion_sg
  ]
  tags = {
    Name = "${var.bastion_host_name}"
  }
}

resource "aws_instance" "sandbox_private" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = aws_subnet.sandbox_private1.id
  security_groups = [aws_security_group.private_instance_sg.id]
  depends_on = [
    aws_security_group.private_instance_sg
  ]
  tags = {
    Name = "${var.private_instance_name}"
  }
}

resource "aws_security_group" "bastion_sg" {
  vpc_id      = var.vpcid
  name        = "bastion_sg"
  description = "Security group for bastion"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "bastion_sg"
  }
}

resource "aws_security_group" "private_instance_sg" {
  vpc_id      = var.vpcid
  name        = "private_instance_sg"
  description = "Security group for private instance"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
    description     = "Allow SSH access from bastion host"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "private_instance_sg"
  }
}

