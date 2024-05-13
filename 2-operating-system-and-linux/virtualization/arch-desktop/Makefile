SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run the virtual machine with Gnome
	vagrant up --provider virtualbox --provision-with main-setup,xorg,gnome,sound

run-kde: ## Run the virtual machine with KDE
	vagrant up --provider virtualbox --provision-with main-setup,xorg,kde,sound

run-nix: ## Run the virtual machine with Nix packages, no desktop environment
	vagrant up --provider virtualbox --provision-with main-setup,nix,nix-home-manager

reload-gnome: ## Reload the virtual machine with Gnome
	vagrant reload --provision-with main-setup,xorg,gnome,sound

clean: ## Destroy the virtual machine
	vagrant destroy -f