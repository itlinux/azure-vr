#Azure vNet
resource "azurerm_resource_group" "rg" {
  name     = var.prefix
  location = var.location
}
provider "azurerm" {
  version = ">2.0.0"
  features {}
}
