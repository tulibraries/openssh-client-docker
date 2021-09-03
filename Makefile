include .env
export #exports the .env variables

#Set DOCKER_IMAGE_VERSION in the .env file OR by passing in
VERSION ?= $(DOCKER_IMAGE_VERSION)
IMAGE ?= tulibraries/openssh-client
HARBOR ?= harbor.k8s.temple.edu
CLEAR_CACHES ?= no
CI ?= false

build:
	@docker build --tag $(HARBOR)/$(IMAGE):$(VERSION) \
		--tag $(HARBOR)/$(IMAGE):latest \
		--tag $(IMAGE) \
		--no-cache .

lint:
	@if [ $(CI) == false ]; \
		then \
			hadolint Dockerfile; \
		fi

scan:
	@if [ $(CLEAR_CACHES) == yes ]; \
		then \
			trivy image -c $(HARBOR)/$(IMAGE):$(VERSION); \
		fi
	@if [ $(CI) == false ]; \
		then \
			trivy $(HARBOR)/$(IMAGE):$(VERSION); \
		fi

shell:
	@docker run --rm -it --user root \
		$(DEFAULT_RUN_ARGS) \
		$(HARBOR)/$(IMAGE):$(VERSION)
