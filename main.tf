resource "aws_vpc" "main" {
  for_each = var.subnets
  cidr_block = var.cidr
}

module "subnets" {
  source = "./subnets"
  for_each = module.subnets
  subnets = each.value
  vpc_id = aws_vpc.main.id
}