module "vpc1" {
  source               = "./vpc1"
  igw                  = "vpcA_igw"
  vpcname              = "vpcA"
  vpc_cidr             = "192.168.0.0/16"
  public_subnet1_cidr  = "192.168.0.0/20"
  public_subnet2_cidr  = "192.168.16.0/20"
  private_subnet1_cidr = "192.168.128.0/20"
  private_subnet2_cidr = "192.168.144.0/20"
  region               = "us-east-1"
  availability_zone_a  = "us-east-1a"
  availability_zone_b  = "us-east-1b"
  natgw-name           = "vpcA nat gw"
}

module "vpc2" {
  source               = "./vpc2"
  igw                  = "vpcB_igw"
  vpcname              = "vpcB"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet1_cidr  = "10.1.0.0/24"
  public_subnet2_cidr  = "10.1.1.0/24"
  private_subnet1_cidr = "10.1.2.0/24"
  private_subnet2_cidr = "10.1.3.0/24"
  region               = "us-east-1"
  availability_zone_a  = "us-east-1a"
  availability_zone_b  = "us-east-1b"
  natgw-name           = "vpcB nat gw"
}

module "vpc3" {
  source               = "./vpc3"
  igw                  = "vpcC_igw"
  vpcname              = "vpcC"
  vpc_cidr             = "192.168.0.0/16"
  public_subnet1_cidr  = "192.168.0.0/20"
  public_subnet2_cidr  = "192.168.16.0/20"
  private_subnet1_cidr = "192.168.128.0/20"
  private_subnet2_cidr = "192.168.144.0/20"
  region               = "us-east-1"
  availability_zone_a  = "us-east-1a"
  availability_zone_b  = "us-east-1b"
  natgw-name           = "vpcC nat gw"
}