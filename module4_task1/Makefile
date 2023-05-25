DOCKER_IMAGE = awesome:build
DOCKER_RUN = docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE)

build-docker: ## Build Docker image
	docker build -t $(DOCKER_IMAGE) -f .build/Dockerfile .

lint: ## lint
	$(DOCKER_RUN) markdownlint -f DEPLOY.md README.md || true

build:  ## Build awesome-api
	$(DOCKER_RUN) go build -o awesome-api
	hugo -d dist/

run: ## Run awesome-api application
	$(DOCKER_RUN) ./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stop awesome-api application
	$(DOCKER_RUN) pkill awesome-api || true

clean: ## Clean awesome-api application and log
	$(DOCKER_RUN) pkill awesome-api || true
	$(DOCKER_RUN) rm -f awesome-api awesome-api.log coverage-units.out coverage-integrations.out
	$(DOCKER_RUN) rm -rf ./dist

post: ## Create a new blog post
	$(DOCKER_RUN) hugo new posts/$(POST_NAME).md
	$(DOCKER_RUN) sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

test: ## Test current connection
	make unit-tests
	make integration-tests

unit-tests: ## Run tests to check for HelloHandler coverage
	$(DOCKER_RUN) go test -v -short -coverprofile=coverage-units.out

integration-tests: ## Run tests to check integrations coverage
	$(DOCKER_RUN) go test -v -coverprofile=coverage-integrations.out

check: ## Check markdown files
	$(DOCKER_RUN) markdownlint ./content/posts/*.md
	$(DOCKER_RUN) markdown-link-check ./content/posts/*.md

validate: ## Validate HTML with W3C Validator
	make build
	$(DOCKER_RUN) git clone https://github.com/holbertonschool/W3C-Validator.git

package: ## Produce awesome-website.zip containing awesome-api and dist directory
	$(DOCKER_RUN) zip -FSr awesome-website.zip . -i dist/ awesome-api
	@if [ ! -f "awesome-website.zip" ]; then \
		echo "Failed to generate awesome-website.zip"; \
		exit 1; \
	fi

.SILENT:
help: ## Display what each command does
	cat Makefile | grep '##' | tr -d '##' | head -n -1
