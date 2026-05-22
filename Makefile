.PHONY: help install test check qa migrate migrate-status build diff-check benchmark-baseline bootstrap-cost octane-up octane-down octane-logs octane-reload octane-watch front race-demo locking-demo memory-leak-demo octane-status benchmark-octane deploy-smoke

help: ## Show available project commands
	@grep -E '^[a-zA-Z0-9_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-22s %s\n", $$1, $$2}'

install: ## Install PHP and frontend dependencies
	composer install
	npm install

test: ## Run Laravel test suite
	php artisan test

check: ## Run smoke checks for the Laravel/Filament project
	php -v
	composer --version
	composer validate --strict
	php artisan --version
	npm --version
	$(MAKE) test

qa: check build diff-check ## Run the local quality entrypoint

migrate: ## Apply database migrations
	php artisan migrate

migrate-status: ## Show Laravel migration status
	php artisan migrate:status

build: ## Build frontend assets
	npm run build

diff-check: ## Check whitespace errors in git diff
	git diff --check

benchmark-baseline: ## Measure baseline HTTP routes before Octane
	bash scripts/benchmark-baseline.sh

bootstrap-cost: ## Compare light and database routes in the classic lifecycle
	bash scripts/benchmark-bootstrap-cost.sh

octane-up: ## Start FrankenPHP/Octane runtime through Docker Compose
	docker compose -f docker-compose.octane.yml up -d app

octane-down: ## Stop FrankenPHP/Octane runtime
	docker compose -f docker-compose.octane.yml down

octane-logs: ## Follow FrankenPHP/Octane logs
	docker compose -f docker-compose.octane.yml logs -f app

octane-reload: ## Reload Octane workers after code or config changes
	php artisan octane:reload --server=frankenphp

octane-watch: ## Start Octane in local watch mode
	php artisan octane:start --server=frankenphp --host=127.0.0.1 --port=8000 --watch

front: ## Build frontend assets and reload Octane workers
	npm run build
	$(MAKE) octane-reload

race-demo: ## Run local lost update demonstration
	php scripts/race-demo.php

locking-demo: ## Run locked counter demonstration
	php scripts/locking-tradeoff-demo.php

memory-leak-demo: ## Call local memory leak endpoint repeatedly
	bash scripts/memory-leak-demo.sh

octane-status: ## Show Octane container status and recent logs
	bash scripts/octane-status.sh

benchmark-octane: ## Measure the same routes under Octane runtime
	bash scripts/benchmark-octane.sh

deploy-smoke: ## Run cheap smoke checks after reload or deploy
	bash scripts/deploy-smoke.sh
