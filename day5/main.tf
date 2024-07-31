module "vpc1" {
  source               = "./modules/vpc"
  vpc_name             = "vpc-A"
  cidr_block           = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnet_cidrs = ["10.1.2.0/24", "10.1.3.0/24"]
}

module "vpc2" {
  source               = "./modules/vpc"
  vpc_name             = "vpc-B"
  cidr_block           = "192.168.0.0/16"
  public_subnet_cidrs  = ["192.168.0.0/20", "192.168.16.0/20"]
  private_subnet_cidrs = ["192.168.128.0/20", "192.168.144.0/20"]
}

module "vpc3" {
  source               = "./modules/vpc"
  vpc_name             = "vpc-C"
  cidr_block           = "192.168.0.0/16"
  public_subnet_cidrs  = ["192.168.0.0/20", "192.168.16.0/20"]
  private_subnet_cidrs = ["192.168.128.0/20", "192.168.144.0/20"]
}

module "instance-ab" {
  source        = "./modules/Instances"
  ami_id        = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name      = "80xg"
  instance_name = "Server-AB"
  vpcid         = module.vpc1.vpc_id
  publicsubnet  = module.vpc1.public_subnet_ids[0]
  region        = "us-east-1"
}

module "instance-ac" {
  source        = "./modules/Instances"
  ami_id        = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name      = "80xg"
  instance_name = "Server-AC"
  vpcid         = module.vpc1.vpc_id
  publicsubnet  = module.vpc1.public_subnet_ids[1]
  region        = "us-east-1"
}

module "instance-b" {
  source        = "./modules/Instances"
  ami_id        = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name      = "80xg"
  instance_name = "Server-B"
  vpcid         = module.vpc2.vpc_id
  publicsubnet  = module.vpc2.public_subnet_ids[0]
  region        = "us-east-1"
}

module "instance-c" {
  source        = "./modules/Instances"
  ami_id        = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name      = "80xg"
  instance_name = "Server-C"
  vpcid         = module.vpc3.vpc_id
  publicsubnet  = module.vpc3.public_subnet_ids[1]
  region        = "us-east-1"
}

#VPC Peering
resource "aws_vpc_peering_connection" "vpc_peer_A_to_B" {
  vpc_id      = module.vpc1.vpc_id
  peer_vpc_id = module.vpc2.vpc_id
  auto_accept = true

  tags = {
    Name = "vpcA-to-vpcB"
  }
}

resource "aws_vpc_peering_connection" "vpc_peer_A_to_C" {
  vpc_id      = module.vpc1.vpc_id
  peer_vpc_id = module.vpc3.vpc_id
  auto_accept = true

  tags = {
    Name = "vpcA-to-vpcC"
  }
}

resource "aws_route" "vpcAB-rt" {
  route_table_id            = module.vpc1.public_route_table_id
  destination_cidr_block    = "192.168.0.0/20"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_A_to_B.id
  depends_on = [
    aws_vpc_peering_connection.vpc_peer_A_to_B
  ]
}

resource "aws_route" "vpcAC-rt" {
  route_table_id            = module.vpc1.public_route_table_id
  destination_cidr_block    = "192.168.16.0/20"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_A_to_C.id
  depends_on = [
    aws_vpc_peering_connection.vpc_peer_A_to_C
  ]
}

resource "aws_route" "vpcB-rt" {
  route_table_id            = module.vpc2.public_route_table_id
  destination_cidr_block    = "10.1.0.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_A_to_B.id
  depends_on = [
    aws_vpc_peering_connection.vpc_peer_A_to_B
  ]
}

resource "aws_route" "vpcC-rt" {
  route_table_id            = module.vpc3.public_route_table_id
  destination_cidr_block    = "10.1.0.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer_A_to_C.id
  depends_on = [
    aws_vpc_peering_connection.vpc_peer_A_to_C
  ]
}