variable "subscription_id" {
  description = "The subscription ID"
}

variable "resource_group_location" {
  type        = string
  default     = "canadacentral"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "jrg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "azureuser"
}

# Virtual Machine Configuration

## VM Size
## D-Series
## 2 CPU, 8 GB RAM from:
## https://learn.microsoft.com/en-us/azure/virtual-machines/sizes/general-purpose/dv2-series?tabs=sizebasic
## Minimal size is "Standard_DS1_v2"
## "Standard_D2s_v3" is recommended for the source_image
variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_D2s_v3"
}

## Source Image
variable "source_image_publisher" {
  description = "The publisher of the source image"
  type        = string
  default     = "Canonical"
}

variable "source_image_offer" {
  description = "The offer of the source image"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "source_image_sku" {
  description = "The SKU of the source image"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "source_image_version" {
  description = "The version of the source image"
  type        = string
  default     = "latest"
}

## See values at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
variable "os_disk_storage_account_type" {
  description = "The type of storage account to use for the OS disk"
  type        = string
  default     = "StandardSSD_LRS"
}

# VM Network Inbound/Outbound Firewall Security Rules
variable "nsg_security_rules" {
  description = "List of security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "InboundNexus8081"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8081"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
