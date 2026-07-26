locals {
  nat_subnet_assocs = flatten([
    for k, v in var.nat_gateways : [
      for s in v.subnet_names : {
        assoc_key           = "${k}-${s}"
        natgw_key           = k
        subnet_name         = s
        vnet_name           = v.vnet_name
        resource_group_name = v.resource_group_name
      }
    ]
  ])
}

data "azurerm_subnet" "snet" {
  for_each             = { for x in local.nat_subnet_assocs : x.assoc_key => x }
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.nat_gateways
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "natgw" {
  for_each            = var.nat_gateways
  name                = each.value.natgw_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "pip_assoc" {
  for_each             = var.nat_gateways
  nat_gateway_id       = azurerm_nat_gateway.natgw[each.key].id
  public_ip_address_id = azurerm_public_ip.pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "snet_assoc" {
  for_each       = { for x in local.nat_subnet_assocs : x.assoc_key => x }
  subnet_id      = data.azurerm_subnet.snet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.natgw[each.value.natgw_key].id
}
