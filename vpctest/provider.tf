terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}
provider "aws" {
  profile = "sandbox"
  region  = "us-east-1"
}