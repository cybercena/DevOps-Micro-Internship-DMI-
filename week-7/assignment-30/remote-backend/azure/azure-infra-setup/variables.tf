variable "resource_group_name" {
  description = "Name of the resource group for backend infrastructure"
  type        = string
  default     = "tfstate-backend-rg"
}

variable "location" {
  description = "Azure region for the backend resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Globally unique name for the storage account"
  type        = string
  default     = "tfstatebackend14003"
}

variable "container_name" {
  description = "Name of the container that will store the Terraform state"
  type        = string
  default     = "tfstate"
}

