data "azurerm_subnet" "subnets" {
  for_each             = var.dev_vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}


