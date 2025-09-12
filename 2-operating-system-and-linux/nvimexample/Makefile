SHELL := /bin/bash

CONFIG_FOLDER_WINDOWS := ~/AppData/Local/nvimexample/
CONFIG_FOLDER_NIX := ~/.config/nvimexample/

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.ONESHELL:
setup: ## Setup folders if they do not already exist
	if [ -d /c/Users ]; then
		echo "On Windows, creating config folder"
		mkdir -p ${CONFIG_FOLDER_WINDOWS} 
	else
		echo "On Unix/Linux, creating config folder"
		mkdir -p ${CONFIG_FOLDER_NIX} 
	fi

.ONESHELL:
install: setup ## Copy Neovim example configuration to configuration folders
	folder=${CONFIG_FOLDER_NIX}
	if [ -d /c/Users ]; then
		folder=${CONFIG_FOLDER_WINDOWS}	
	fi
	cp -r ./* $$folder
	cd $$folder
	printf "\nCopied data to:\n"
	pwd
	ls -al
