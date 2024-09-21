#!/bin/bash

# https://confluence.atlassian.com/bbkb/troubleshoot-failed-bitbucket-pipelines-locally-with-docker-1318882094.html

# npm run build:pipeline
docker stop react-test-pipeline || true && docker rm react-test-pipeline || true
docker system prune -f
docker build --memory=1g --memory-swap=1g -t account/imagename:tag -f react-test.dockerfile .
docker run -it --name react-test-pipeline --memory=4g --memory-swap=4g --memory-swappiness=0 --cpus=4 --entrypoint=/bin/bash account/imagename:tag