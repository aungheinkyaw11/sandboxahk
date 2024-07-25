module "network" {
  source = "./Network"
  igw = "sandbox_igw"
  vpcname = "sandboxahk_vpc"
  vpc_cidr   = "10.1.0.0/16"
  public_subnet1_cidr = "10.1.0.0/24"
  public_subnet2_cidr = "10.1.1.0/24"
  private_subnet1_cidr = "10.1.2.0/24"
  private_subnet2_cidr = "10.1.3.0/24"
  region = "us-east-1"
  availability_zone_a  = "us-east-1a"
  availability_zone_b  = "us-east-1b"  
  natgw-name = "sandbox nat gw"
}

module "instances" {
  source = "./Instances"
  ami_id = "ami-04a81a99f5ec58529" 
  instance_type = "t2.micro"
  key_name = "80xg"
  private_instance_name = "private-instance"
  bastion_host_name = "bastion_host"
  vpcid = module.network.vpcid
  privatesubnet = module.network.privatesubnet1
  publicsubnet = module.network.sandbox_public2
  region = "us-east-1"
}