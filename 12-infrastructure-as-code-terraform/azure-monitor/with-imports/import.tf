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

variable "monitoring_resource_group_id" {
  description = "The ID of the resource group to import containing monitoring resources"
}

variable "monitoring_log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace to import"
}

#############################################
# Provider
#############################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

#############################################
# Resources to be Managed/Imported: 
# - Resource Group
# - Monitoring Resources
#############################################

import {
  to = "monitoring_resource_group"
  id = var.monitoring_resource_group_id
}

import {
  to = "log_analytics_workspace"
  id = var.monitoring_log_analytics_workspace_id
}