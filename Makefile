.DEFAULT_GOAL := help

# ──────────────────────────────────────────────
# Setup
# ──────────────────────────────────────────────

.PHONY: setup
setup: ## Install dependencies for all packages and app
	git config core.hooksPath .githooks
	@echo "TODO: implement setup"

.PHONY: clean
clean: ## Remove build artifacts and caches
	@echo "TODO: implement clean"

# ──────────────────────────────────────────────
# Development
# ──────────────────────────────────────────────

.PHONY: dev
dev: ## Start development servers
	@echo "TODO: implement dev"

.PHONY: build
build: ## Build all packages and app
	@echo "TODO: implement build"

.PHONY: lint
lint: ## Run linters
	@echo "TODO: implement lint"

.PHONY: fmt
fmt: ## Format code
	@echo "TODO: implement fmt"

# ──────────────────────────────────────────────
# Test
# ──────────────────────────────────────────────

.PHONY: test
test: ## Run all tests
	@echo "TODO: implement test"

.PHONY: test-watch
test-watch: ## Run tests in watch mode
	@echo "TODO: implement test-watch"

# ──────────────────────────────────────────────
# Help
# ──────────────────────────────────────────────

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
