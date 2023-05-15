lint: ## lint
	golangci-lint run ./main.go

build: lint ## Build awesome-api
	go build -o awesome-api

run: ## Run awesome-api application
	./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stop awesome-api application
	kill $$(pgrep awesome-api) || true

clean: stop ## Clean awesome-api application and log
	rm -f awesome-api awesome-api.log

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

.SILENT:
help: ## Display what each command does
	cat Makefile | grep '##' | tr -d '##' | head -n -1

