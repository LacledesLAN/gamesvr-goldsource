# Gold Source Dedicated Servers in Docker

Gold Source (abbreviated "GoldSrc") is a game engine developed by Valve Corporation, first showcased in the 1998 first-person shooter game Half-Life. This GoldSrc Docker image includes dedicated server binaries and content for Counter-Strike 1.6, Counter-Strike: Condition Zero, Day of Defeat, Deathmatch Classic, Half-Life Deathmatch, Half-Life: Opposing Force, Ricochet, and Team Fortress Classic.

![GoldSrc Collage](https://raw.githubusercontent.com/LacledesLAN/gamesvr-goldsource/master/.misc/artwork1.jpg "GoldSrc Collage")

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are intended to be bare-bones and used as a stock server. For examples of building a customized server from this Docker image browse its related child-project [gamesvr-goldsource-cstrike](https://github.com/LacledesLAN/gamesvr-goldsource-cstrike), [gamesvr-goldsource-dmc](https://github.com/LacledesLAN/gamesvr-goldsource-dmc), [gamesvr-goldsource-hldm](https://github.com/LacledesLAN/gamesvr-goldsource-hldm), and [gamesvr-goldsrc-tfc](https://github.com/LacledesLAN/gamesvr-goldsource-tfc). If any documentation is unclear or it has any issues please see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Linux

[![Build Status](https://travis-ci.org/LacledesLAN/gamesvr-goldsource.svg?branch=master)](https://travis-ci.org/LacledesLAN/gamesvr-goldsource)
[![](https://images.microbadger.com/badges/version/lacledeslan/gamesvr-goldsource.svg)](https://microbadger.com/images/lacledeslan/gamesvr-goldsource "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/lacledeslan/gamesvr-goldsource.svg)](https://microbadger.com/images/lacledeslan/gamesvr-goldsource "Get your own image badge on microbadger.com")

### Download
```
docker pull lacledeslan/gamesvr-goldsource;
```

### Run Self Tests

The image includes a test script that can be used to verify its contents. No changes or pull-requests will be accepted to this repository if any tests fail.

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.sh;
```

### Counter-Strike 1.6

#### Run Simple, Interactive Server

```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game cstrike +map de_dust2 +maxplayers 24;
```

#### Self-Test

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.cstrike.sh;
```

### Counter-Strike Condition Zero

#### Run simple interactive server

```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game czero +map as_oilrig +maxplayers 24;
```

#### Self-Test

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.czero.sh;
```

### Deathmatch Classic

#### Run simple interactive server

```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game dmc +map dcdm5 +maxplayers 16;
```

#### Self-Test

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.dmc.sh;
```

### Day of Defeat

**Run simple interactive server**
```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run 1 -game dod +map dod_avalanche +maxplayers 24;
```

#### Self-Test
```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.dod.sh;
```

### Half-Life Deatmatch

**Run simple interactive server**
```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game valve +map crossfire +maxplayers 16;
```

#### Self-Test
```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.hldm.sh;
```

### Half-Life Opposing Force

#### Run simple interactive server

```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game gearbox +map op4_bootcamp +maxplayers 16;
```

#### Self-Test

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.gearbox.sh;
```

### Ricochet

**Run simple interactive server**
```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game ricochet +map rc_arena +maxplayers 16;
```

#### Self-Test

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.ricochet.sh;
```

### Team Fortress Classic

**Run simple interactive server**

```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run +sv_lan 1 -game tfc +map dustbowl +maxplayers 16;
```

#### Self-Test

```
docker run -it --rm lacledeslan/gamesvr-goldsource ./ll-tests/gamesvr-goldsource.tfc.sh;
```

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable, self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks, and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
