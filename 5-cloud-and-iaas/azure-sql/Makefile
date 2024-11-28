SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

apply: az-login ## Apply the Bicep template to create the Azure SQL Server and Database
	az deployment sub create --location "Canada Central" --template-file main.bicep

az-login: ## Login to Azure
	az login

destroy: ## Destroy the Azure SQL Server and Database using the resource group delete
	# Prompt user for resource group name
	@read -p "Enter the resource group name: " resourcegroupname; \
	Remove-AzResourceGroup -Name $$resourcegroupname -Verbose