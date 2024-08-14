resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id     = var.vpc_id
  cidr = each.value["cidr"]
  az = each.value["az"]

  tags = {
    Name = ""
  }
}


