SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build project
	go build main.go

run: ## Run project
	go run main.go

test-web-api: ## Test web api
	curl localhost:8080
	curl localhost:8080/show-tasks
