PHONY: build

CHIA_VERSION=1.2.11
DOCKER_TAG_NAME=jakegough/chia-network-plus

build:
	docker build --build-arg CHIA_VERSION=$(CHIA_VERSION) -t $(DOCKER_TAG_NAME):$(CHIA_VERSION) .
	docker tag $(DOCKER_TAG_NAME):$(CHIA_VERSION) $(DOCKER_TAG_NAME):latest

push: build
	docker push $(DOCKER_TAG_NAME):$(CHIA_VERSION)
	docker push $(DOCKER_TAG_NAME):latest
