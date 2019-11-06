REPO=tsuzu/github-actions-runner

.PHONY: base docker build

base:
	docker build -t ${REPO} .

docker: base
	docker build -f Dockerfile-docker -t ${REPO}:docker .

build: base docker

