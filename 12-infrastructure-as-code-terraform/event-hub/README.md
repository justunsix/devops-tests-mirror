# Event Hub creation with Terraform

Creates an Event Hub and test connectivity to it.

Using Terraform to create an Event Hub in Azure. After creation, the Event Hub connectivity is tested using the `curl` command.

## Prerequisites

- Terraform
- Azure CLI
- Make (optional)

## Usage

```sh
# Set the Azure subscription ID like:
# shell:
export TF_VAR_subscription_id="your_subscription_id"
# powershell:
#$env:TF_VAR_subscription_id="your_subscription_id"

# Run make all && make test-eventhub-connection 
# which will run the following commands
# or continue with these commands:
terraform apply

# Initilize the terraform project
terraform init
# Upgrade the terraform project
terraform init -upgrade

az-login: ## Login to Azure
## Required otherwise Terraform plan can generate errors like "marshaling: string ield contains invalid UTF-8"
az login
# Get from environment variable
az account set --subscription $(TF_VAR_subscription_id)
# powershell option:
# az account set --subscription $env:TF_VAR_subscription_id

# Format the terraform files
terraform fmt
# Validate the terraform files
terraform validate

## Plan Terraform deployment and output plan
terraform plan -out=tfplan

## Apply Terraform deployment and show
terraform apply tfplan

## See state file and resources
terraform state list

## See state
terraform show

## Test new connection
curl -v $(EVENTHUB_DNS):9093

```

## Clean up

Run `terraform destroy -auto-approve` or `make tf-destroy`

## Resources

TODO Investigate usage of Azure Verified Modules:

- Terraform: https://github.com/Azure/terraform-azurerm-avm-res-eventhub-namespace
- Bicep: https://github.com/Azure/bicep-registry-modules/tree/main/avm/res/event-hub/namespace