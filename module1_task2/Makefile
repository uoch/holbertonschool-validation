## Makefile for Go-Hugo website


build:
	hugo

## clean: Cleans up the build directory
clean:
	rm -rf dist/*


post:
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

## help : Help about any command
help:
	@echo "Usage:"
	cat Makefile | grep "^#" | sed 's/#/\n#/'

