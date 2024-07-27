resource "aws_vpc" "a4_vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(local.my_map,
    {
      Name = "${terraform.workspace}-vpc"
    }
  )
}

resource "aws_internet_gateway" "a4_igw" {
  vpc_id = aws_vpc.a4_vpc.id
  tags = merge(local.my_map,
    {
      Name = "${terraform.workspace}-igw"
    }
  )
}

resource "aws_eip" "vpc_eip" {
  domain = "vpc"
}

resource "aws_subnet" "a4_publicsubnet" {
  vpc_id     = aws_vpc.a4_vpc.id
  cidr_block = var.public_cidr
  tags = merge(local.my_map,
    {
      Name = "${terraform.workspace}-publicsubnet"
    }
  )
}

resource "aws_route_table" "pubic_routetable" {
  vpc_id = aws_vpc.a4_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.a4_igw.id
  }
  tags = merge(local.my_map,
    {
      Name = "${terraform.workspace}-public_rt"
    }
  )
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.a4_publicsubnet.id
  route_table_id = aws_route_table.pubic_routetable.id
}

resource "aws_security_group" "my_instance_sg" {
  vpc_id      = aws_vpc.a4_vpc.id
  name        = "${terraform.workspace}-my_instance_sg"
  description = "Security group for my instance"

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
  tags = merge(local.my_map,
    {
      Name = "${terraform.workspace}-my_instance_sg"
    }
  )
}

# Generate RSA SSH key pair
resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Store the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.rsa-key.private_key_pem
  filename        = "${path.module}/${terraform.workspace}-private-key.pem"
  file_permission = "0400"
}

# Define the Key Pair in AWS
resource "aws_key_pair" "rsa_key_pair" {
  key_name   = "${terraform.workspace}-public-key"
  public_key = tls_private_key.rsa-key.public_key_openssh
}

resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.rsa_key_pair.key_name
  subnet_id       = aws_subnet.a4_publicsubnet.id
  security_groups = [aws_security_group.my_instance_sg.id]
  tags = merge(local.my_map,
    {
      Name = "${terraform.workspace}-instance"
    }
  )
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.my_instance.id
}



locals {
  my_map = {
    "Managed by"  = "Terraform"
    "Environment" = "${terraform.workspace}"
  }
}