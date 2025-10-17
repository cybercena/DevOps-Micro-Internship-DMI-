terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-backend-rg"
    storage_account_name = "tfstatebackend09876"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "remote-backend-demo-rg"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
