FROM ubuntu:18.04

ARG GITHUB_ACTIONS_RUNNER="https://githubassets.azureedge.net/runners/2.160.0/actions-runner-linux-x64-2.160.0.tar.gz"
ENV AGENT_ALLOW_RUNASROOT=1

RUN apt update && \
	apt install -y --no-install-recommends curl ca-certificates software-properties-common apt-utils && \
	mkdir actions-runner && cd actions-runner && \
	curl -O $GITHUB_ACTIONS_RUNNER && \
	tar xzf *.tar.gz && \
	rm *.tar.gz && \
	./bin/installdependencies.sh && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /actions-runner
ADD ./docker-entrypoint.sh .
CMD ./docker-entrypoint.sh
