#!/bin/bash
# Run this on the Raspberry-pi to start the container
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"

if ! dpkg -l | grep docker.io; then
  apt-get update
  apt-get install -y docker.io
fi

if [ ! -f /etc/init.d/surge-pi ] || ! diff /etc/init.d/surge-pi surge.initd &> /dev/null; then
  echo "=> Installing /etc/init.d/surge-pi"
  cp surge.initd /etc/init.d/surge-pi
  chmod 755 /etc/init.d/surge-pi
fi

c="surge"
if docker inspect "${c}" &> /dev/null; then
  echo "=> Killing container ${c}"
  docker kill "${c}"
fi
set +e
docker rm "${c}"
set -e

docker run -d \
  --name "${c}" \
  --privileged \
  --restart=unless-stopped \
  --publish 80:80 \
  -v "${ROOT}/web:/var/www/html" \
  -e APACHE_RUN_USER=root \
  surge-pi \
  bash -cex "service apache2 start ; while true; do sleep 6000; done"
