module "azurerm_resource_group" {
  source = "../../module/resources"
  rg_map = var.rg_map
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../module/networking"
  vnet_map   = var.vnet_map
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network]
  source     = "../../module/public_ ip"
  pip_map    = var.pip_map

}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.azurerm_resource_group, module.azurerm_virtual_network, module.azurerm_public_ip]
  source     = "../../module/compute"
  nic_vm_map = var.nic_vm_map

}

