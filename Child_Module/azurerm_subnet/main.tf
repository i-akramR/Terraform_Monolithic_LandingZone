resource "azurerm_subnet" "snet" {
  for_each = var.subnets
  
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = ["10.128.1.0/24"]
}