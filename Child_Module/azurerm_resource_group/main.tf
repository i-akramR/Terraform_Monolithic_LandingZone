resource "azurerm_resource_group" "resource-group" {
  for_each = var.RGS

  name     = each.value.rg_name
  location = each.value.rg_location
}