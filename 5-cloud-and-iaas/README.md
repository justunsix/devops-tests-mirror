# DevOps Infrastructure

Project is used to set up a server to host an application and the DevOps infrastructure (Nexus artifact repository, Jenkins) to support it.

## What is Set up

- Set up Ubuntu Linux virtual machine (VM) in Microsoft Azure
 - Set variables set in [`variables.tf`](vm\variables.tf) 
  - See Usage section below or [`Makefile`](vm/Makefile) on how to set up the VM
- Configure VM shell scripts or Ansible

## Usage

```sh
# Set the Azure subscription ID you are using for the VM::
# shell:
export TF_VAR_subscription_id="your_subscription_id"
# or PowerShell:
$env:TF_VAR_subscription_id="your_subscription_id"

# Log into Azure if needed, like with az login
# Follow commands explained in the Quickstart: Use Terraform to create a Linux VM at
# https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli) guide that explains how to use the template
# In summary, the commands are:

# Initialize the terraform project
terraform init --upgrade

# Create and apply the terraform plan
terraform plan -out main.tfplan
terraform apply main.tfplan

# Store the Terraform output of key_data_private in a file
# shell
terraform output key_data_private > ~/.ssh/azure_vm_key.rsa
# PowerShell
terraform output key_data_private > C:\Users\myusername\.ssh\azure_vm_key.rsa

# SSH into the VM
## Username is azureuser specified in variables.tf
ssh -i ~/.ssh/azure_vm_key.rsa azureuser@<public_ip_of_VM>

# Since the VM is created using SSH key, running sudo with commands
# should not prompt for the password
```

## See Also

- Folder uses instructions and code templates mainly from [Azure Linux VM Terraform template](https://github.com/Azure/terraform/tree/master/quickstart/101-vm-with-infrastructure) 
- [Hasicorp Terraform's VM basic SSH example](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/virtual-machines/linux/basic-ssh)
 
