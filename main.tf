# azure provider and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.63.0"
    }
  }
}


#create resource provider
provider "azurerm" {
  features {

  }
}

# create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = "firstterraform-rg"
  location = "West Europe"
}
#create vnet within the resource group

resource "azurerm_virtual_network" "myvnet" {
  name                = "firstterraform-vnet"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = ["10.0.0.0/16"]


}

# create subnet within the vnet

resource "azurerm_subnet" "mysubnet" {
  name                 = "firstterraform-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]


}
