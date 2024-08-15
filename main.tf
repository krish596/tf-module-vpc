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

  tags = {
    Name = ""
  }
}

resource "aws_route" "igw" {
  route_table_id            = module.subnets["public"]["route_table_ids"]
  destination_cidr_block    = "0.0.0.0/0"
  vpc_peering_connection_id = "pcx-45ff3dc1"
}

output "subnets" {
  value = module.subnets
}