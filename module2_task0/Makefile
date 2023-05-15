

## build: Builds the website
build:
	@hugo
	@go build -o awesome-api

run: ## Run the application in background
	@./awesome-api ./awesome.log

stop: ## Stop the application with the command kill
	@pkill awesome-api

## clean: Cleans up the build directory
clean:
	@rm -rf dist/*
	@rm -f awesome-api awesome.log

## post : POST_NAME=<post-name> POST_TITLE=<post-title>: Creates a new blog post with the specified name and title
post:
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

## help : Help about any command
help:
	@cat Makefile | grep "^#" | sed 's/^## \(.*\)/\1\n/'

