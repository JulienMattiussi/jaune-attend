.PHONY: start build

# =====================================================================
# Common commands =====================================================
# =====================================================================

start: ## Start local site
	yarn serve

build: ## Build site for prod
	yarn build

lint: ## Lint the code
	yarn lint
