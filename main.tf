resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

module "subnets" {
  source = "./subnets"
  for_each = var.subnets
  subnets = each.value
  vpc_id = aws_vpc.main.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

}
output "vpc" {
  value = module.subnets
}
# resource "aws_route" "igw" {
#   for_each = var.
#   route_table_id            = aws_route_table.testing.id
#   destination_cidr_block    = "10.0.1.0/22"
#   vpc_peering_connection_id = "pcx-45ff3dc1"
# }