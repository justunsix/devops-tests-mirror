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
      version = "3.92.0"
    }
  }
}

# Configure the Microsoft Azure Provider
# Using subscription 0042hscdev46wrk 
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bot_healthbot
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "justinTerraformhealthbot"
  location = "eastus"

  tags = {
    createdby = "terraform"
  }
}

resource "azurerm_healthbot" "justintfhealthbot" {
  name                = "justintfhealthbot"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "F0"
  tags = {
    createdby = "terraform"
  }
}