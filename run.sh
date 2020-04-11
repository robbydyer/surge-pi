#!/bin/bash
# Run this on the Raspberry-pi to start the container

docker run -d \
  --privileged \
  --publish 80:80 \
  surge-pi \
  bash
