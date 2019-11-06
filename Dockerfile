FROM ubuntu:18.04

ENV AGENT_ALLOW_RUNASROOT=1

RUN apt update && \
	apt install -y --no-install-recommends curl ca-certificates software-properties-common apt-utils && \
	mkdir actions-runner && cd actions-runner && \
	curl -O https://githubassets.azureedge.net/runners/2.160.0/actions-runner-linux-x64-2.160.0.tar.gz && \
	tar xzf ./actions-runner-linux-x64-2.160.0.tar.gz && \
	./bin/installdependencies.sh && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /actions-runner
CMD ./config.sh --url "$GITHUB_URL" --token "$GITHUB_TOKEN" && ./run.sh
