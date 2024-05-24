# Azure Monitoring with Terraform

Uses existing resource groups and monitor resources and then configures them to monitor Azure resources

Prior to Terraform commands, set variables for Terraform to read

```sh
# Set the Azure subscription ID like in shell or source .env file like:
export TF_VAR_subscription_id="Azure subscription id"
# and other variables to import:
export TF_VAR_monitoring_resource_group_id="id of the resource group holding monitoring resources"
export TF_VAR_monitoring_log_analytics_workspace_id="id of the log analytics workspace"
```

Run commands these commands or use the commands in the [Makefile](Makefile) which are numbers in order of sequence to run.

```sh
# Initilize the terraform project
terraform init
# Upgrade the terraform project
terraform init -upgrade

## Login to Azure
## Required otherwise Terraform plan can generate errors like "marshaling: string field contains invalid UTF-8"
az login --use-device-code
az account set --subscription $(TF_VAR_subscription_id)

## Format and validate Terraform files
# Format the terraform files
terraform fmt
# Validate the terraform files
terraform validate

## Plan Terraform deployment, get imported resources, and out imported resources configurations
## Usage https://developer.hashicorp.com/terraform/language/import/generating-configuration
## tf file must not exist
terraform plan -out=tfplan -generate-config-out=generated_resources.tf

## Plan Terraform deployment
terraform plan -out=tfplan

## Apply Terraform deployment and show
terraform apply tfplan

## See state
terraform show
```
