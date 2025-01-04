SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run the virtual machine as CLI only
	vagrant up clionly --provider virtualbox --provision-with main-setup,nix,nix-home-manager,lazyvim,azure-cli,docker,aws-cli,k3s

run-up-cli-micro: ## Turn on cli-micro VM
	vagrant up cli-micro

run-cli-all: ## Run the virtual machine as CLI only with all provisioners 
	vagrant up cli-small --provider virtualbox --provision-with main-setup,activate-editor,activate-devops,activate-ansible,nix,nix-home-manager,lazyvim,k3s

run-cli-all-pb: ## Run the virtual machine as CLI using prebuilt box and provisioners for development
	vagrant up cli-smal-pb --provider virtualbox --provision-with main-setup,activate-editor,nix-home-manager,lazyvim

run-cli-devops: ## Run the virtual machine as CLI only with programs for devops testing
	vagrant up cli-small --provider virtualbox --provision-with main-setup,activate-editor,activate-devops,nix,nix-home-manager,lazyvim,k3s

run-cli-editor: ## Run the virtual machine as CLI only with minimal programs and advanced editor
	vagrant up cli-micro --provider virtualbox --provision-with main-setup,activate-editor,nix,nix-home-manager,lazyvim

run-cli-ansible-controller: ## Run the virtual machine as CLI only with ansible
	vagrant up cli-micro --provider virtualbox --provision-with main-setup,activate-ansible,nix,nix-home-manager

run-cli-minimal: ## Run the virtual machine as CLI only with minimal programs
	vagrant up cli-micro --provider virtualbox --provision-with main-setup,nix,nix-home-manager

run-gnome: ## Run the virtual machine with GNOME Desktop
	vagrant up desktop-medium --provider virtualbox --provision-with main-setup,gnome

clean: ## Destroy the virtual machine
	vagrant destroy -f
