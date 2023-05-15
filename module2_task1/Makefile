# Implement the next steps for the actual Go-Hugo website's source code


build: ## build: Builds the website
	@hugo
	@go build -o awesome-api ./*.go
## Run : the application in background
run: 
	@./awesome-api >./awesome-api.log 2>&1 &


stop: ## Stop : the application with the command kill
	@pkill awesome-api


clean: ## clean: Cleans up the build directory
	@rm -rf dist/*
	@rm -f awesome-api awesome-api.log
	@pkill awesome-api
lint: ## Catch such errors without the need to compile or execute the application
	@golangci-lint run ./*.go


test: ## test: Ensure that it behaves as expected
	@echo "# Test 1:"
	@if curl  http://localhost:9999 ; then \
		echo "TESTOK"; \
	else \
		echo "TESTFAILED"; \
	fi
	@echo "# Test 2:"
	@if curl  http://localhost:9999/health ; then \
		echo "TESTOK"; \
	else \
		echo "TESTFAILED"; \
	fi


post: ## post : POST_NAME=<post-name> POST_TITLE=<post-title>: Creates a new blog post with the specified name and title
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md


help: ## help : Help about any command
	@echo "Usage: make <command>"
	@echo "-----"
	@cat Makefile | grep "^\w*:.*##.*" | sed 's/## //'

