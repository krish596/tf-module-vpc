output "subnets" {
  value = module.subnets
}
output "public_subnet_ids" {
  value = local.public_subnet_ids
}
output "vpc" {
  value = aws_vpc.main.id
}

