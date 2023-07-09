terraform {
  required_version = "~> 1.5.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }
#   cloud {
#     organization = "leonss18-org"
#     workspaces {
#       name = "TerraformCI"
#     }
#   }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg_acloudguru" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet_acloudguru" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.rg_acloudguru.name
  location            = azurerm_resource_group.rg_acloudguru.location
  address_space       = ["10.0.0.0/16"]
}
