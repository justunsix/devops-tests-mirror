#############################################
# Variables
#############################################

variable "subscription_id" {
  description = "The subscription ID"
}

variable "location" {
  description = "The location where resources should be created"
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "justintftestrg"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  default     = "justintftestsa1"
}

variable "storage_container_name" {
  description = "The name of the storage container"
  default     = "vhds"
}

#############################################
# Provider
#############################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

#############################################
# Resources to be Managed: 
# - Resource Group
# - Storage Account
#   - Storage Container
#############################################

resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    createdby = "terraform"
  }
}

resource "azurerm_storage_account" "sa1" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    createdby = "terraform"
  }
}

resource "azurerm_storage_container" "container1" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa1.name
  container_access_type = "private"
}

output "resource_group" {
  value = azurerm_resource_group.rg1
}

output "storage_account" {
  value = azurerm_storage_account.sa1
  sensitive = true
}

output "storage_container" {
  value = azurerm_storage_container.container1
}