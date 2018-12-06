.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = drone-git-tag-delete
MY_PWD = $(shell pwd)

all: build

build:
ifdef NOCACHE
	docker build --no-cache -t $(IMAGE_BASE)/$(IMAGE) .
else
	docker build -t $(IMAGE_BASE)/$(IMAGE) .
endif

push:
	docker push $(IMAGE_BASE)/$(IMAGE)

run:
	docker run --rm -p 80:80 -p 443:443 --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE)
