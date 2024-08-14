resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id     = var.vpc_id


}

variable "subnets" {}
variable "vpc_id" {}
