# escape=`

FROM lacledeslan/steamcmd:linux as goldsource-builder

ARG contentServer=content.lacledeslan.net
ARG STEAM_USERNAME
ARG STEAM_PASSWORD

USER SteamCMD

RUN if [ -z "$STEAM_USERNAME" ]; then echo "Missing steam username"; exit 111; elif [ -z "$STEAM_PASSWORD" ]; then echo "Missing steam password"; exit 222; fi

# Counter-Strike 1.6 Assets (not compressed)
RUN wget -r -nH --no-verbose --cut-dirs=2 --no-parent --reject="index.htm*, *.md" -e robots=off --directory-prefix="/output/cstrike/" "http://content.lacledeslan.net/fastDownloads/goldsrc-cstrike/"

# Make sure SteamCMD is up to date (cuts down on log output noise)
RUN /app/steamcmd.sh +force_install_dir /output +quit;

RUN echo $'<Counter-Strike 1.6>\n' &&`
	for i in 10 70; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/CounterStrike/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod cstrike +app_update 90 validate +quit; do sleep 1; done &&`
    for i in 10 70; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Counter-Strike 1.6>\n\n\n';

RUN echo $'<Counter-Strike: Condition Zero>\n' &&`
	for i in 10 70 80 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/CounterStrikeConditionZero/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod czero +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 70 80; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Counter-Strike: Condition Zero>\n\n\n';

RUN echo $'<Day of Defeat>\n' &&`
	for i in 10 30 70 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/DayOfDefeat/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod dod +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 30 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Day of Defeat>\n\n\n';

RUN echo $'<Deathmatch Classic>\n' &&`
	for i in 10 40 70 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/DeathmatchClassic/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod dmc +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 40 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Deathmatch Classic>\n\n\n';

RUN echo $'<Half-Life: Deathmatch>\n' &&`
	for i in 10 70 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/HalfLifeDeathmatch/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Half-Life: Deathmatch>\n\n\n';

RUN echo $'<Opposing Force>\n' &&`
	for i in 10 50 70 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/OpposingForce/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod gearbox +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 50 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Opposing Force>\n\n\n';

RUN echo $'<Ricochet>\n' &&`
	for i in 10 60 70 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/Ricochet/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod ricochet +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 60 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Ricochet>\n\n\n';

RUN echo $'<Team Fortress Classic>\n' &&`
	for i in 10 20 70 90; do wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/TeamFortressClassic/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
    until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod tfc +app_update 90 validate +quit; do sleep 1; done &&`
	for i in 10 20 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done &&`
    echo '\n</Team Fortress Classic>\n\n\n';

RUN echo 90 > /output/steam_appid.txt;

#####=======================================================================
FROM debian:bookworm-slim

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

HEALTHCHECK NONE

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        ca-certificates lib32gcc-s1 libcurl4-gnutls-dev:i386 libstdc++6 libstdc++6:i386 locales locales-all tmux &&`
		apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* &&`
	echo "LC_ALL=en_US.UTF-8" >> /etc/environment &&`
	useradd --home /app --gid root --system GoldSource

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

LABEL maintainer="Laclede's LAN <contact @lacledeslan.com>" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="Gold Source Server in Docker" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-goldsource"

COPY --chown=GoldSource:root --from=goldsource-builder /output /app

COPY --chown=GoldSource:root ./dist/linux/ll-tests /app/ll-tests

RUN chmod +x /app/ll-tests/*.sh &&`
    mkdir --parents /app/.steam/sdk32 --parents &&`
    ln -s /app/steamclient.so /app/.steam/sdk32/steamclient.so &&`
    mkdir --parents /app/gearbox/SAVE;

RUN echo 10 > /app/steam_appid.txt

USER GoldSource

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
