locals {
  #subnets
  public_subnet_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "subnet_ids", null): v.id]
  app_subnet_ids = [for k,v in lookup(lookup(module.subnets, "app", null), "subnet_ids", null): v.id]
  db_subnet_ids = [for k,v in lookup(lookup(module.subnets, "sb", null), "subnet_ids", null): v.id]

  # RT
  public_route_table_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "route_table_ids", null): v.id]
  app_route_table_ids = [for k,v in lookup(lookup(module.subnets, "app", null), "route_table_ids", null): v.id]
  db_route_table_ids = [for k,v in lookup(lookup(module.subnets, "sb", null), "route_table_ids", null): v.id]
}