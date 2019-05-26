.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build the containers
	docker build -t employees .

up: ## Start container
	docker run --rm --detach --publish 3306:3306 --name=employees employees

down: ## Stop container
	docker stop employees

console: ## Enter into MySQL Console
	docker exec -i -t employees mysql -h 127.0.0.1 -P 3306 -u employees -pemployees employees
