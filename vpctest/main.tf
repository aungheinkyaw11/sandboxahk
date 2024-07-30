module "vpc1" {
  source               = "./modules/vpc"
  vpc_name             = "vpc1"
  cidr_block           = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "vpc2" {
  source               = "./modules/vpc"
  vpc_name             = "vpc2"
  cidr_block           = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]
}

module "vpc3" {
  source               = "./modules/vpc"
  vpc_name             = "vpc3"
  cidr_block           = "10.2.0.0/16"
  public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24"]
  private_subnet_cidrs = ["10.2.3.0/24", "10.2.4.0/24"]
}

