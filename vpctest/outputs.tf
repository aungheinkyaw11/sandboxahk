output "vpc1_id" {
  value = module.vpc1.vpc_id
}

output "vpc2_id" {
  value = module.vpc2.vpc_id
}

output "vpc3_id" {
  value = module.vpc3.vpc_id
}

output "vpc1_public_subnet_ids" {
  value = module.vpc1.public_subnet_ids
}

output "vpc1_private_subnet_ids" {
  value = module.vpc1.private_subnet_ids
}

output "vpc2_public_subnet_ids" {
  value = module.vpc2.public_subnet_ids
}

output "vpc2_private_subnet_ids" {
  value = module.vpc2.private_subnet_ids
}

output "vpc3_public_subnet_ids" {
  value = module.vpc3.public_subnet_ids
}

output "vpc3_private_subnet_ids" {
  value = module.vpc3.private_subnet_ids
}

output "vpc1_internet_gateway_id" {
  value = module.vpc1.internet_gateway_id
}

output "vpc1_nat_gateway_id" {
  value = module.vpc1.nat_gateway_id
}

output "vpc2_internet_gateway_id" {
  value = module.vpc2.internet_gateway_id
}

output "vpc2_nat_gateway_id" {
  value = module.vpc2.nat_gateway_id
}

output "vpc3_internet_gateway_id" {
  value = module.vpc3.internet_gateway_id
}

output "vpc3_nat_gateway_id" {
  value = module.vpc3.nat_gateway_id
}
