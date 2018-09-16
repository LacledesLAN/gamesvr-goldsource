# escape=`

FROM lacledeslan/steamcmd:linux as goldsource-builder

ARG contentServer=content.lacledeslan.net

USER SteamCMD

# Counter-Strike 1.6 Maps
RUN echo $'Downloading LL custom cstrike maps from content server' &&`
		mkdir --parents /tmp/maps/ &&`
		cd /tmp/maps/ &&`
		wget -rkp -l 1 -nH --no-verbose --cut-dirs=3 -R "*.htm*" -e robots=off "http://"$contentServer"/fastDownloads/cstrike/maps/" &&`
	echo "Decompressing map files" &&`
		bzip2 --decompress /tmp/maps/*.bz2 &&`
	echo "Moving uncompressed map files to destination" &&`
		mkdir --parents /output/cstrike/maps/ &&`
		mv -n /tmp/maps/*.bsp /output/cstrike/maps/;

# Half-Life Deathmatch Maps
RUN echo $'Downloading LL custom hldm maps from content server' &&`
		mkdir --parents /tmp/maps/ &&`
		cd /tmp/maps/ &&`
		wget -rkp -l 1 -nH --no-verbose --cut-dirs=3 -R "*.htm*" -e robots=off "http://"$contentServer"/fastDownloads/hldm/maps/" &&`
	echo "Decompressing map files" &&`
		bzip2 --decompress /tmp/maps/*.bz2 &&`
	echo "Moving uncompressed map files to destination" &&`
		mkdir --parents /output/valve/maps/ &&`
		mv -n /tmp/maps/*.bsp /output/valve/maps/;

# Half-Life Deathmatch Models
RUN echo "Downloading LL custom hldm models from content server" &&`
		mkdir --parents /tmp/models/ &&`
		cd /tmp/models/ &&`
		wget -rkp -l 2 -nH --no-verbose --cut-dirs=3 -R "*.htm*" -R "*.ico" -R "*.md" -R "*.png" -e robots=off "http://"$contentServer"/fastDownloads/hldm/models/" &&`
	echo "Moving model files to destination" &&`
		mkdir --parents /output/valve/models/ &&`
		mv -n /tmp/models/* /output/valve/models/;

### ⚠⚠ Steam AppId 90 currently require multiple installs https://github.com/ValveSoftware/steam-for-linux/issues/4950
###	⚠⚠ workaround via http://danielgibbs.co.uk/2017/10/hlds-steamcmd-workaround-appid-90-part-ii/#

RUN echo $'\n\n\n\n\nCounter-Strike 1.6' &&`
	for i in 10 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/CounterStrike/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod cstrike validate +quit; done &&`
	for i in 10 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nCounter-Strike: Condition Zero\n===================================\n' &&`
	for i in 10 70 80 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/CounterStrikeConditionZero/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod czero validate +quit; done &&`
	for i in 10 70 80 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nDay of Defeat\n===================================\n' &&`
	for i in 10 30 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/DayOfDefeat/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod dod validate +quit; done &&`
	for i in 10 30 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nDeathmatch Classic\n===================================\n' &&`
	for i in 10 40 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/DeathmatchClassic/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod dmc validate +quit; done &&`
	for i in 10 40 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nHalf-Life: Deathmatch\n===================================\n' &&`
	for i in 10 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/HalfLifeDeathmatch/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 validate +quit; done &&`
	for i in 10 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nOpposing Force\n===================================\n' &&`
	for i in 10 50 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/OpposingForce/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod gearbox validate +quit; done &&`
	for i in 10 50 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nRicochet\n===================================\n' &&`
	for i in 10 60 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/Ricochet/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod ricochet validate +quit; done &&`
	for i in 10 60 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo $'\n\n\n\n\nTeam Fortress Classic\n===================================\n' &&`
	for i in 10 20 70 90; do wget -P /output -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/TeamFortressClassic/appmanifest_$i.acf -O appmanifest_$i.acf; done &&`
	for i in 0 1 2 3; do /app/steamcmd.sh +login anonymous +force_install_dir /output +app_update 90 +app_set_config 90 mod tfc validate +quit; done &&`
	for i in 10 20 70 90; do rm -f /output/appmanifest_$i.acf; done;

RUN echo 90 > /output/steam_appid.txt;

#####=======================================================================
FROM debian:stretch-slim

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

HEALTHCHECK NONE

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        ca-certificates lib32gcc1 lib32tinfo5 libcurl4-gnutls-dev:i386 libstdc++6 libstdc++6:i386 locales locales-all tmux &&`
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

COPY --chown=GoldSource:root ./ll-tests /app/ll-tests

RUN chmod +x /app/ll-tests/*.sh;

USER GoldSource

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
