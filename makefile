IMAGE := json0/go-reference-app
TAG := 1.1

docker-build: .built-docker-image

.built-docker-image: Dockerfile makefile
	docker build -t $(IMAGE) .
	touch .built-docker-image

tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)

push: .built-docker-image
	docker tag $(IMAGE) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)

go-build:
	go build wiki.go
