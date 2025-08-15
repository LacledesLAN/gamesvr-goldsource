#!/bin/bash
set -eu

if [ -n "${LL_STEAM_USERNAME:-}" ]; then
    s_username="$LL_STEAM_USERNAME"
    echo "Using Steam username from LL_STEAM_USERNAME env var."
else
    echo -n "Enter steam username: "
    read -r s_username
fi

if [ -n "${LL_STEAM_PASSWORD:-}" ]; then
    s_password="$LL_STEAM_PASSWORD"
    echo "Using Steam password from LL_STEAM_PASSWORD env var."
else
    echo -n "Enter steam password: "
    read -rs s_password
    echo
fi

docker pull lacledeslan/steamcmd:linux;

docker pull debian:trixie-slim;

docker build -f ./linux.Dockerfile . -t lacledeslan/gamesvr-goldsource --build-arg BUILDNODE="$HOSTNAME" --build-arg STEAM_USERNAME="$s_username" --build-arg STEAM_PASSWORD="$s_password";

docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.sh;

# Push to Docker HUB?

while true; do

read -rp "Do you want to push to Docker HUB? (yes/no) " yn

case $yn in
    yes ) docker push lacledeslan/gamesvr-goldsource;
        break;;
    no ) echo skipping...;
        break;;
    * ) echo invalid response;
esac

done;
