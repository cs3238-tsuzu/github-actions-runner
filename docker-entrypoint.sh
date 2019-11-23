#! /bin/bash
set -eu

if [ ! -e ".credentials" ]; then
	echo "Running registration"
	./config.sh --url "$GITHUB_URL" --token "$GITHUB_TOKEN" 
fi

while :
do
	yes | ./run.sh || :
done
