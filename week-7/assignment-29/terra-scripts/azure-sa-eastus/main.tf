#configuring provider
provider "azurerm" {
  features {}
}

#creating resources
resource "azurerm_resource_group" "rg" {
  name     = "company-dev-assets-use1"
  location = "East US"
}

#defining length for random number
resource "random_id" "suffix" {
  byte_length = 2
}

#creating a storage account
resource "azurerm_storage_account" "example" {
  name                     = "azsaeastus${random_id.suffix.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project     = "multicloud-foundation"
    owner       = "Sonam Tamang"
    environment = "dev"
  }
}
