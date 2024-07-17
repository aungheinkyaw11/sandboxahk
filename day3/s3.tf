resource "aws_s3_bucket" "terraformstatebucket" {
  bucket = "terraform-statebucket-ahk"

  tags = {
    Name        = "terraformstatebucket"
    Environment = "Dev"
  }
}


terraform {
  backend "s3" {
    bucket         = "terraform-statebucket-ahk"
    key            = "terraform.tfstate"
    region         = "us-east-1" 
    profile        = "sandbox"
  }
}