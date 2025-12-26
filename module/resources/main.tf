resource "azurerm_resource_group" "laxmi_rg1" {
 for_each  = var.rg_map
  name     = each.value.name 
  location = each.value.location
}