FROM ubuntu:18.04

ENV AGENT_ALLOW_RUNASROOT=1

RUN apt update && \
	apt install -y curl && \
	mkdir actions-runner && cd actions-runner && \
	curl -O https://githubassets.azureedge.net/runners/2.160.0/actions-runner-linux-x64-2.160.0.tar.gz && \
	tar xzf ./actions-runner-linux-x64-2.160.0.tar.gz && \
	./bin/installdependencies.sh

WORKDIR /actions-runner
CMD "./config.sh --url $GITHUB_URL --token $GITHUB_TOKEN && ./run.sh"
