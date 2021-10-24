.PHONY: help build run watch

.SILENT: help build run watch

.DEFAULT_GOAL : help

help: ## Show help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Make production build
	npm run build

run: ## Run production server
	cd build/ && cp ../.env ./ && npm ci --production && node server.js

watch: ## Run server in develop mode with watcher
	npm run dev
