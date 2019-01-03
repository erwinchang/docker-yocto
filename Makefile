all: build

help:
	@echo ""
	@echo "-- Help Menu"
	@echo "  1. make run         - start docker image"
	@echo "  2. make build       - build image"
	@echo "  3. make release     - release image"

run:
	@docker run -v ${HOME}:/mnt/home --rm --name yocto-image -it erwinchang/yocto /bin/bash

build:
	@docker build --tag=erwinchang/yocto .

release: build
	@docker build --tag=erwinchang/yocto:$(shell cat VERSION) .

