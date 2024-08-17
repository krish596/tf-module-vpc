locals {
  public_subnet_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "subnet_ids", null): v.id]
}