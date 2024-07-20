resource "aws_security_group" "bastion_sg" {
  vpc_id      = aws_vpc.sandboxahk_vpc.id
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
  vpc_id      = aws_vpc.sandboxahk_vpc.id
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

