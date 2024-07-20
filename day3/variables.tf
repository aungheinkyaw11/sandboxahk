# variables.tf

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = "10.1.0.0/24"
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = "10.1.2.0/24"
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = "10.1.3.0/24"
}

variable "availability_zone_a" {
  description = "The availability zone for the first subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_b" {
  description = "The availability zone for the second subnet"
  type        = string
  default     = "ap-south-1b"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ad21ae1d0696ad58"  # Example Ubuntu Server 22.04
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
  default     = "ahk-sandbox"  # Replace with your key pair name
}