#!/bin/bash

echo -n "Enter steam username: "
read -r s_username

echo -n "Enter steam password: "
read -rs s_password

docker pull lacledeslan/steamcmd:linux;

docker pull debian:bullseye-slim;

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
