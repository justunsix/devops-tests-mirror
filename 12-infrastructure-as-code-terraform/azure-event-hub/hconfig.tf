variable "subscription_id" {
  description = "The subscription ID"
}

# Docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
# Using subscription ID from an environment variable 
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "justinTerraformEventHubrg"
  location = "canadacentral"

  tags = {
    createdby = "terraform"
  }
}

resource "azurerm_eventhub_namespace" "testevns" {
  name                = "justintfeventhubns"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    createdby = "terraform"
  }
}

resource "azurerm_eventhub" "testev" {
  name                = "justintfeventhub"
  namespace_name      = azurerm_eventhub_namespace.testevns.name
  resource_group_name = azurerm_resource_group.rg.name
  partition_count     = 2
  message_retention   = 1

}

# # Output Event Hub Namespace DNS
# output "eventhub_dns" {
#   value       = azurerm_eventhub.testev.fully_qualified_domain_name
#   description = "The DNS name of the Event Hub"
# }

# resource "azurerm_eventhub_namespace" "example1" {
#   name                = "example-namespace1"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku                 = "Standard"
#   capacity            = 1
# }

# resource "azurerm_eventhub" "example1" {
#   name                = "example-hub1"
#   namespace_name      = azurerm_eventhub_namespace.example1.name
#   resource_group_name = azurerm_resource_group.rg.name
#   partition_count     = 2
#   message_retention   = 1
# }

# resource "azurerm_eventhub_namespace" "example2" {
#   name                = "example-namespace2"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku                 = "Standard"
#   capacity            = 1
# }

# resource "azurerm_eventhub" "example2" {
#   name                = "example-hub2"
#   namespace_name      = azurerm_eventhub_namespace.example2.name
#   resource_group_name = azurerm_resource_group.rg.name
#   partition_count     = 2
#   message_retention   = 1
# }

# resource "azurerm_eventhub_namespace" "example3" {
#   name                = "example-namespace3"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku                 = "Standard"
#   capacity            = 1
# }

# resource "azurerm_eventhub" "example3" {
#   name                = "example-hub3"
#   namespace_name      = azurerm_eventhub_namespace.example3.name
#   resource_group_name = azurerm_resource_group.rg.name
#   partition_count     = 2
#   message_retention   = 1
# }