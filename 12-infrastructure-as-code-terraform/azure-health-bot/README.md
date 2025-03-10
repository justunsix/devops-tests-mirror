# Event Hub creation with Terraform

Using Terraform to create an Azure Health Bot.

Once created, in the Azure Portal, go to the bot's Management portal, login and test chat.

## Prerequisites

- Terraform
- Azure CLI

## Usage

```sh
# Set the Azure subscription ID like:
# shell:
export TF_VAR_subscription_id="your_subscription_id"
# powershell:
#$env:TF_VAR_subscription_id="your_subscription_id"

# Run make all && make test-eventhub-connection or continue in shell:
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
