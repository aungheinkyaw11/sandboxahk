module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"
}

provider "aws" {
  profile = "sandbox"
  region  = "ap-south-1"
}