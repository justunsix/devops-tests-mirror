SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

run: ## Run the virtual machine as CLI only
	vagrant up clionly --provider virtualbox --provision-with main-setup,nix,nix-home-manager,lazyvim

run-gnome: ## Run the virtual machine with GNOME Desktop
	vagrant up desktopvm --provider virtualbox --provision-with main-setup,gnome

clean: ## Destroy the virtual machine
	vagrant destroy -f