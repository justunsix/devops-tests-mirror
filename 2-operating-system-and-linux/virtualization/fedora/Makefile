SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run the virtual machine
	vagrant up --provider virtualbox --provision-with main,ansible,final

run-minimal: ## Run the virtual machine with minimal configuration
	vagrant up --provider virtualbox --provision-with main,final

clean: ## Destroy the virtual machine
	vagrant destroy -f