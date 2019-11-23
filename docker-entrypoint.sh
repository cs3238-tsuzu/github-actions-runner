#! /bin/bash

if [ ! -e ".credentials" ]; then
	./config.sh --url "$GITHUB_URL" --token "$GITHUB_TOKEN" 
fi

yes | ./run.sh
