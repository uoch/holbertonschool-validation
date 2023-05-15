

## build: Builds the website
build:
	@hugo
	@go build -o awesome-api ./*.go
## Run : the application in background
run: 
	@./awesome-api >./awesome-api.log 2>&1 &

## Stop : the application with the command kill
stop: 
	@pkill awesome-api

## clean: Cleans up the build directory
clean:
	@pkill awesome-api
	@rm -rf dist/*
	@rm -f awesome-api awesome-api.log 


## test: Ensure that it behaves as expected
test: 
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

## post : POST_NAME=<post-name> POST_TITLE=<post-title>: Creates a new blog post with the specified name and title
post:
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

## help : Help about any command
help:
	@cat Makefile | grep "^#" | sed 's/^## \(.*\)/\1\n/'

