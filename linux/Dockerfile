# escape=`

FROM lacledeslan/steamcmd:linux as goldsource-builder

# Counter-Strike 1.6 Maps
RUN echo "Downloading cstrike maps from content server" &&` 
	mkdir --parents /tmp/maps/ &&`
	cd /tmp/maps/ &&`
	wget -m ` 	
		ftp://llgameserverbot:6gDyfNJhm4UsraE5@raw.content.lacledeslan.net/hldm/maps/ ` 
		-nH --no-verbose --cut-dirs 4 &&`
		rm -f .listing &&` 
	echo "Decompressing map files" &&`
		bzip2 --decompress /tmp/maps/*.*.bz2 &&`
		rm -f /tmp/maps/*.bz2 &&`
	echo "Moving uncompressed map files to destination" &&`
		mkdir --parents /output/cstrike/maps/ &&`
		mv /tmp/maps/*.* /output/cstrike/maps/ &&`
	echo "Performing Cleanup" &&`
		rm -rf /tmp/maps;

# Half-Life Deathmatch Maps
RUN echo "Downloading hldm maps from content server" &&` 
	mkdir --parents /tmp/maps/ &&`
	cd /tmp/maps/ &&`
	wget -m ` 	
		ftp://llgameserverbot:6gDyfNJhm4UsraE5@raw.content.lacledeslan.net/hldm/maps/ ` 
		-nH --no-verbose --cut-dirs 4 &&`
		rm -f .listing &&` 
	echo "Decompressing map files" &&`
		bzip2 --decompress /tmp/maps/*.*.bz2 &&`
		rm -f /tmp/maps/*.bz2 &&`
	echo "Moving uncompressed map files to destination" &&`
		mkdir --parents /output/valve/maps/ &&`
		mv /tmp/maps/*.* /output/valve/maps/ &&`
	echo "Performing Cleanup" &&`
		rm -rf /tmp/maps;

# Half-Life Deathmatch Models
RUN echo "Downloading hldm models from content server" &&`
	mkdir --parents /tmp/models/ &&`
	cd /tmp/models/ &&`
	wget -m `
		ftp://llgameserverbot:6gDyfNJhm4UsraE5@raw.content.lacledeslan.net/hldm/models/ `
		-nH --no-verbose --cut-dirs 4 &&`
		rm -f .listing &&`
	echo "Moving model files to destination" &&`
		mkdir --parents /output/valve/models/ &&`
		mv  /tmp/models/* /output/valve/models/ &&`
	echo "Performing Cleanup" &&`
		rm -rf /tmp/models;

#=======================================================================
FROM debian:stretch-slim

HEALTHCHECK NONE

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

LABEL maintainer="Laclede's LAN <contact @lacledeslan.com>" `
      com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="Gold Source Server in Docker" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-goldsource"

RUN dpkg --add-architecture i386 &&`
    apt-get update && apt-get install -y `
        ca-certificates lib32gcc1 lib32tinfo5 libcurl4-gnutls-dev:i386 libstdc++6 libstdc++6:i386 &&`
    apt-get clean &&`
    rm -rf /var/lib/apt/lists/*;

## Gold Source is so large we can't reliably use multi-stage builds in docker cloud

# Copy files in from builder
COPY --from=goldsource-builder /output /app

# Copy cached build files (if any)
COPY ./build-cache /app

#Pull in SteamCMD
COPY --from=goldsource-builder /app /app/steamcmd

# Install Gold Source
RUN echo $'\n\nDownloading Gold Source via SteamCMD' &&`
        /app/steamcmd/steamcmd.sh `
            +login anonymous `
            +force_install_dir /app `
            +app_update "90 -beta Beta" validate `
            +quit;

## Add in tests
COPY ./tests /app/ll-tests

RUN echo $'\n\nCreating user "GoldSource" (to group "root" until [github.com/moby/moby/pull/34263] makes it into CE stable)' &&`
        useradd --home /app --gid root --system `
            GoldSource &&`
    echo 'Setting user directory permissions' &&`
        chown GoldSource:root /app &&`
        find /app -type d -exec chmod 775 {} + &&`
        chmod +x /app/ll-tests/*.sh

# Intentionally set after all build steps
USER GoldSource

WORKDIR /app

ONBUILD USER root
