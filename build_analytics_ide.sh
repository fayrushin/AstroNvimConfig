#!/bin/bash

docker build --build-arg USER_ID="${UID:-1000}" \
  --build-arg GROUP_ID="${GID:-1000}" \
  --build-arg BASE_IMAGE=analytics_base \
  --build-arg IMAGE_VERSION=latest \
  --build-arg GIT_USER_NAME="Ravil Fayrushin" \
  --build-arg GIT_USER_EMAIL="ravil.fayrushin@gmail.com" \
  -f Dockerfile -t developer .
