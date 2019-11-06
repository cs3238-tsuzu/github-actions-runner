REPO=tsuzu/github-actions-runner

.PHONY: base docker build

base:
	docker build -t ${REPO} .

base-push:
	docker push ${REPO}

docker:
	docker build -f Dockerfile-docker -t ${REPO}:docker .

docker-push:
	docker push ${REPO}:docker

build: base docker

push: base-push docker-push
