module "network" {
  source = "./Network"
  igw = "sandbox_igw"
  vpcname = "sandboxahk_vpc"
  vpc_cidr   = "10.1.0.0/16"
  public_subnet1_cidr = "10.1.0.0/24"
  public_subnet2_cidr = "10.1.1.0/24"
  private_subnet1_cidr = "10.1.2.0/24"
  private_subnet2_cidr = "10.1.3.0/24"
  availability_zone_a  = "ap-south-1a"
  availability_zone_b  = "ap-south-1b"  
  natgw-name = "sandbox nat gw"
}