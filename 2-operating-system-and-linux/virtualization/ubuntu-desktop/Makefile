SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run the virtual machine as CLI only
	vagrant up clionly --provider virtualbox --provision-with main-setup,nix,nix-home-manager,lazyvim,azure-cli,docker,aws-cli,k3s

run-up-clionly: ## Turn on clionly VM
	vagrant up clionly

run-cli-all: ## Run the virtual machine as CLI only with all provisioners 
	vagrant up clionly --provider virtualbox --provision-with main-setup,activate-editor,activate-devops,activate-ansible,ansible-for-windows,nix,nix-home-manager,lazyvim,k3s

run-cli-devops: ## Run the virtual machine as CLI only with programs for devops testing
	vagrant up clionly --provider virtualbox --provision-with main-setup,activate-editor,activate-devops,nix,nix-home-manager,lazyvim,k3s

run-cli-editor: ## Run the virtual machine as CLI only with minimal programs and advanced editor
	vagrant up clionly --provider virtualbox --provision-with main-setup,activate-editor,nix,nix-home-manager,lazyvim

run-cli-ansible-controller: ## Run the virtual machine as CLI only with ansible
	vagrant up clionly --provider virtualbox --provision-with main-setup,activate-ansible,ansible-for-windows,nix,nix-home-manager

run-cli-minimal: ## Run the virtual machine as CLI only with minimal programs
	vagrant up clionly --provider virtualbox --provision-with main-setup,nix,nix-home-manager

run-gnome: ## Run the virtual machine with GNOME Desktop
	vagrant up desktopvm --provider virtualbox --provision-with main-setup,gnome

clean: ## Destroy the virtual machine
	vagrant destroy -f
