#!/bin/bash
# Run this on the Raspberry-pi to start the container

if ! dpkg -l | grep docker.io; then
  apt-get update
  apt-get install -y docker.io
fi

docker run -d \
  --privileged \
  --publish 80:80 \
  surge-pi \
  bash
