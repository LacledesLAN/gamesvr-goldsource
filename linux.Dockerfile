# escape=`

FROM lacledeslan/steamcmd:linux AS goldsource-builder

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

RUN echo $'<Team Fortress Classic>\n' && `
    for n in 1 2; do `
        for i in 10 20 70 90; do `
            wget -P /output/steamapps -q https://raw.githubusercontent.com/LacledesLAN/HLDS-appmanifest/master/TeamFortressClassic/appmanifest_$i.acf -O appmanifest_$i.acf; `
        done; `
        until /app/steamcmd.sh +force_install_dir /output +login $STEAM_USERNAME $STEAM_PASSWORD +app_set_config 90 mod tfc +app_update 90 validate +quit; do sleep 1; done; `
        for i in 10 20 70 90; do rm -f /output/steamapps/appmanifest_$i.acf; done; `
    done && `
    echo '\n</Team Fortress Classic>\n\n\n';

RUN echo 90 > /output/steam_appid.txt;

COPY ./dist/linux /output

#####=======================================================================
FROM debian:bookworm-slim

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

HEALTHCHECK NONE

ENV LANG=en_US.UTF-8 `
    LANGUAGE=en_US.UTF-8 `
    LC_ALL=en_US.UTF-8

LABEL `
    com.lacledeslan.build-node=$BUILDNODE `
    org.opencontainers.image.authors="Laclede's LAN <contact@lacledeslan.com>" `
    org.opencontainers.image.description="Gold-Source Dedicated Server for running Counter-Strike 1.6, Day of Defeat, Half-Life 1 Deathmatch, Team Fortress Classic, and others!" `
    org.opencontainers.image.documentation="https://github.com/LacledesLAN/SteamCMD" `
    org.opencontainers.image.source="https://hub.docker.com/r/lacledeslan/steamcmd" `
    org.opencontainers.image.title="Gold-Source Dedicated Server in Docker" `
    org.opencontainers.image.url="https://github.com/LacledesLAN/SteamCMD" `
    org.opencontainers.image.vender="Laclede's LAN"

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        ca-certificates lib32gcc-s1 libcurl4-gnutls-dev:i386 libstdc++6 libstdc++6:i386 locales locales-all tmux &&`
        apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* &&`
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment &&`
    useradd --home /app --gid root --system GoldSource

COPY --chown=GoldSource:root --from=goldsource-builder /output /app

RUN chmod +x /app/ll-tests/*.sh &&`
    mkdir --parents /app/.steam/sdk32 /app/gearbox/SAVE &&`
    ln -s /app/steamclient.so /app/.steam/sdk32/steamclient.so &&`
    chmod -R u+rw /app &&`
    #
    # TRAINING RUNS - Some servers benefit from a training run, to allow them to generate some initial metadata
    # otherwise server may error with: "Your server needs to be restarted in order to receive the latest update."
    #
    cd /app &&`
    echo -e "\n\n[TRAINING RUN: Counter-Strike 1.6]" &&`
    echo 10 > /app/steam_appid.txt &&`
    timeout 30s ./hlds_run +sv_lan 1 -game cstrike +map de_dust2 +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Counter-Strike: Condition Zero]" &&`
    echo 80 > /app/steam_appid.txt &&`
    timeout 30s ./hlds_run +sv_lan 1 -game czero +map as_oilrig +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Deathmatch Classic]" &&`
    echo 40 > /app/steam_appid.txt &&`
    timeout 30s ./hlds_run +sv_lan 1 -game dmc +map dcdm5 +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Day of Defeat]" &&`
    echo 30 > /app/steam_appid.txt &&`
    timeout 30s ./hlds_run +sv_lan 1 -game dod +map dod_avalanche +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Half-Life Deathmatch]" &&`
    echo 90 > /app/steam_appid.txt &&`
    timeout 30s ./hlds_run +sv_lan 1 -game valve +map crossfire +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Half-Life Opposing Force]" &&`
    echo 50 > ./steam_appid.txt &&`
    timeout 30s /app/hlds_run +sv_lan 1 -game gearbox +map op4_bootcamp +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Ricochet]" &&`
    echo 60 > ./steam_appid.txt &&`
    timeout 30s /app/hlds_run +sv_lan 1 -game ricochet +map rc_arena +maxplayers 16 || true &&`
    echo -e "\n\n[TRAINING RUN: Team Fortress Classic]" &&`
    echo 20 > ./steam_appid.txt &&`
    timeout 30s /app/hlds_run +sv_lan 1 -game tfc +map dustbowl +maxplayers 16 || true &&`
    #
    # Finalize
    #
    echo 90 > /app/steam_appid.txt;

USER GoldSource

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root
