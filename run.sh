#!/bin/bash
# Run this on the Raspberry-pi to start the container

if ! dpkg -l | grep docker.io; then
  apt-get update
  apt-get install -y docker.io
fi

if [ ! -f /etc/init.d/surge-pi ] || ! diff /etc/init.d/surge-pi surge.initd &> /dev/null; then
  echo "=> Installing /etc/init.d/surge-pi"
  cp surge.initd /etc/init.d/surge-pi
  chmod 755 /etc/init.d/surge-pi
fi

c="surge-pi"
if docker inspect "${c}" &> /dev/null; then
  echo "=> Killing container ${c}"
  docker kill "${c}"
fi
docker rm "${c}"

docker run -d \
  --name surge \
  --privileged \
  --publish 8080:80 \
  surge-pi \
  bash -cex "while true; do sleep 6000; done"
