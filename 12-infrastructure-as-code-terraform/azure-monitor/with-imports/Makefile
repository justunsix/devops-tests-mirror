SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

1-tf-init: ## Initialize Terraform project
	# Initilize the terraform project
	terraform init
	# Upgrade the terraform project
	terraform init -upgrade

2-az-login: ## Login to Azure
	## Required otherwise Terraform plan can generate errors like "marshaling: string field contains invalid UTF-8"
	## Choose subscription: <subscription_id>
	az login --use-device-code
	az account set --subscription $(TF_VAR_subscription_id)

3-tf-format-and-validate: ## Format and validate Terraform files
	# Format the terraform files
	terraform fmt
	# Validate the terraform files
	terraform validate

.ONESHELL:
4-tf-plan-with-import-configuration: ## Plan Terraform deployment, get imported resources, and out imported resources configurations
	## Usage https://developer.hashicorp.com/terraform/language/import/generating-configuration
	## tf must not exist
	terraform plan -out=tfplan -generate-config-out=generated_resources.tf

4.1-tf-plan: ## Plan Terraform deployment
	terraform plan -out=tfplan

5-tf-apply: ## Apply Terraform deployment and show
	terraform apply tfplan

6-tf-state: ## See state file and resources
	terraform state list

9-tf-destroy:	## Destroy Terraform deployment, Accept with auto-approve
	terraform destroy -auto-approve

6-tf-show: ## See state
	terraform show	

tf-all: 1-tf-init 2-az-login 3-tf-format-and-validate 4-tf-plan 5-tf-apply ## Initialize project, login to Azure, Set up Terraform and Apply Configuration

tf-apply-changes: 3-tf-format-and-validate 4-tf-plan 5-tf-apply ## Apply changes made to configuration to Terraform deployment