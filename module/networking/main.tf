resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnet_map
  name                = each.value.name
  address_space       = ["10.0.0.0/16"]
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
        name = subnet.value.name
        address_prefixes = subnet.value.address_prefixes
      
    }
  }
}

