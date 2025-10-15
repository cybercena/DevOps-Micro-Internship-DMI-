#writing provider block
provider "azurerm" {
 features{}
}


#create a resource group
resource "azurerm_resource_group" "example" {
 name = "terraform-rg"
 location = "East US"
}


#output the resource group name after creation
output "resource_group_name" {
 value = azurerm_resource_group.example.name
}
