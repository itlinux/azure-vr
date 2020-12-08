locals {
  subnet_prefixes = var.address_space
}
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = var.location
  address_space       = [var.address_space]
  resource_group_name = azurerm_resource_group.rg.name
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  depends_on           = [azurerm_virtual_network.vnet]
  name                 = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = [cidrsubnet(local.subnet_prefixes, 8, 1 + count.index)]
  count                = length(var.subnet_names)
}
