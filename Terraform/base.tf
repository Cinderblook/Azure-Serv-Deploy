# Base config
# Vcenter connection parameters
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "east" {
  name     = "east-resources"
  location = "East US"
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.east.name
  address_spaces      = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  depends_on = [azurerm_resource_group.east]
}

