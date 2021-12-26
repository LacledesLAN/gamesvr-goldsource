# Gold Source Dedicated Servers in Docker

Gold Source (abbreviated "GoldSrc") is a game engine developed by Valve Corporation, first showcased in the 1998 first-person shooter game Half-Life. This GoldSrc Docker image includes dedicated server binaries and content for Counter-Strike 1.6, Counter-Strike: Condition Zero, Day of Defeat, Deathmatch Classic, Half-Life Deathmatch, Half-Life: Opposing Force, Ricochet, and Team Fortress Classic.

![GoldSrc Collage](https://raw.githubusercontent.com/LacledesLAN/gamesvr-goldsource/master/.misc/artwork1.jpg "GoldSrc Collage")

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are intended to be bare-bones and used as a stock server. For examples of building a customized server from this Docker image browse its related child-project [gamesvr-goldsource-cstrike](https://github.com/LacledesLAN/gamesvr-goldsource-cstrike), [gamesvr-goldsource-dmc](https://github.com/LacledesLAN/gamesvr-goldsource-dmc), [gamesvr-goldsource-hldm](https://github.com/LacledesLAN/gamesvr-goldsource-hldm), and [gamesvr-goldsource-tfc](https://github.com/LacledesLAN/gamesvr-goldsource-tfc). If any documentation is unclear or it has any issues please see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Linux

[![linux/amd64](https://github.com/LacledesLAN/gamesvr-goldsource/actions/workflows/build-linux-image.yml/badge.svg?branch=master)](https://github.com/LacledesLAN/gamesvr-goldsource/actions/workflows/build-linux-image.yml)

### Download

```shell
docker pull lacledeslan/gamesvr-goldsource;
```

### Run Self Tests

The image includes a test script that can be used to verify its contents. No changes or pull-requests will be accepted to this repository if any tests fail.

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.sh;
```

### Troubleshooting

#### STEAM validation rejected

To use this image as an online capacity (e.g. `sv_lan=0`) the value of the text file */app/steam_appid.txt* must be set with the appropriate id; otherwise Internet connections will be rejected.

| Game                          | Value | Example Snippet                   |
| ----------------------------- | ----- | --------------------------------- |
| Counter-Strike 1.6            | 10    | `echo 10 > /app/steam_appid.txt;` |
| Counter-Strike Condition Zero | 80    | `echo 80 > /app/steam_appid.txt;` |
| Deathmatch Classic            | 40    | `echo 40 > /app/steam_appid.txt;` |
| Day of Defeat                 | 30    | `echo 30 > /app/steam_appid.txt;` |
| Half-Life Deathmatch          | 90    | `echo 90 > /app/steam_appid.txt;` |
| Opposing Force                | 50    | `echo 50 > /app/steam_appid.txt;` |
| Ricochet                      | 60    | `echo 60 > /app/steam_appid.txt;` |
| Team Fortress Classic         | 20    | `echo 20 > /app/steam_appid.txt;` |

> See also [Steam Application IDs](https://developer.valvesoftware.com/wiki/Steam_Application_IDs)

### Counter-Strike 1.6

#### Run Simple, Interactive Server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game cstrike +map de_dust2 +maxplayers 24;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.cstrike.sh;
```

### Counter-Strike Condition Zero

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game czero +map as_oilrig +maxplayers 24;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.czero.sh;
```

### Deathmatch Classic

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game dmc +map dcdm5 +maxplayers 16;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.dmc.sh;
```

### Day of Defeat

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run 1 -game dod +map dod_avalanche +maxplayers 24;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.dod.sh;
```

### Half-Life Deathmatch

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game valve +map crossfire +maxplayers 16;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.hldm.sh;
```

### Half-Life Opposing Force

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game gearbox +map op4_bootcamp +maxplayers 16;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.gearbox.sh;
```

### Ricochet

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game ricochet +map rc_arena +maxplayers 16;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.ricochet.sh;
```

### Team Fortress Classic

#### Run simple interactive server

```shell
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game tfc +map dustbowl +maxplayers 16;
```

#### Self-Test

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.tfc.sh;
```

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable, self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks, and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
