variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "ami_id" {
  default     = "ami-0ad21ae1d0696ad58"
  description = "Ubuntu 24"
  type        = string

}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

