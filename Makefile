# MAKEFILE!

VERSION ?= $(shell cat ./VERSION)

DOCKER_IMAGE := my_apps/hello_world
DOCKER_IMAGE_TAG := $(DOCKER_IMAGE):$(VERSION)

.PHONY: help
help:
	@echo "Available targets:"
	@echo "    build: builds Docker image"
	@echo "    up: spin up application locally"
	@echo "    down: spin down application"
	@echo "    clean: removes local Docker image"

.PHONY: build
build:
ifndef VERSION
	$(error VERSION must be set)
endif
	# Building application Docker image...
	@docker build -t $(DOCKER_IMAGE_TAG) .
	#Done!

.PHONY: up
up: build
	# Spining up application...
	@docker run --rm -d -p 8002:8002 $(DOCKER_IMAGE_TAG)
	# Done!

.PHONY: down
down:
	# Spining down application...
	@docker stop  $$(docker ps | grep hello_world | awk '{print $$1}') -f
	# Done!

.PHONY: clean
clean:
	# Cleaning local Docker image...
	@docker rmi -f $(DOCKER_IMAGE_TAG)
	# Done!

