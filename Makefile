# Docker image makefile

APP_NAME:=surface-water
DOCKER_IMAGE:=pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime
UID:= $(shell id -u $$USER)
GID:= $(shell id -g $$USER)

all: build run

build:
	DOCKER_BUILDKIT=1 docker build --build-arg fromImage=$(DOCKER_IMAGE) --network=host -t $(APP_NAME) .

run:
	docker run -it --mount type=bind,source=$(PWD)/app/src,target=/app/src --mount type=bind,source=$(PWD)/app/data,target=/app/data,readonly --net=host --rm --gpus all -e LOCAL_UID=$(UID) -e LOCAL_GID=$(GID) $(APP_NAME)
