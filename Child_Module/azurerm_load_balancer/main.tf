resource "azurerm_public_ip" "pip" {
  for_each            = var.load_balancers
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  for_each            = var.load_balancers
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = var.load_balancers
  name            = "BackEndAddressPool"
  loadbalancer_id = azurerm_lb.lb[each.key].id
}
