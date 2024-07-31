resource "aws_instance" "myinstance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.publicsubnet
  associate_public_ip_address = true
  security_groups             = [aws_security_group.myinstance_sg.id]
  depends_on = [
    aws_security_group.myinstance_sg
  ]
  tags = {
    Name = "${var.instance_name}"
  }
}

resource "aws_security_group" "myinstance_sg" {
  vpc_id      = var.vpcid
  name        = "${var.instance_name}-sg"
  description = "Allow SSH Access and ICMP from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ICMP traffic from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}