terraform {
  required_version = "~> 1.5.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }
  cloud {
    organization = "leonss18-org"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = True
}

resource "azurerm_resource_group" "rg_acloudguru" {
  name     = "example-resources"
  location = "West Europe"
}
