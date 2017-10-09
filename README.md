# Gold Source Servers in Docker

## Linux

[![](https://images.microbadger.com/badges/version/lacledeslan/gamesvr-goldsource.svg)](https://microbadger.com/images/lacledeslan/gamesvr-goldsource "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/lacledeslan/gamesvr-goldsource.svg)](https://microbadger.com/images/lacledeslan/gamesvr-goldsource "Get your own image badge on microbadger.com")

**Download**
```
docker pull lacledeslan/gamesvr-goldsource
```

**Run self tests**
```
Not Yet implemented
```

### Counter-Strike 1.6

**Run simple interactive server**
```
docker run -it --rm --net=host lacledeslan/gamesvr-goldsource ./hlds_run -console -game cstrike +de_dust2 +maxplayers 32
```

### Deathmatch Classic

**Run simple interactive server**
```
Not Yet implemented
```

### Half-Life Deatmatch

**Run simple interactive server**
```
Not Yet implemented
```

### Team Fortress Classic

**Run simple interactive server**
```
Not Yet implemented
```



## Build Triggers
Automated builds of this image can be triggered by the following sources:
* [Builds of llgameserverbot/trigger-gamesvr-goldsource](https://hub.docker.com/r/llgameserverbot/trigger-gamesvr-goldsource/)
* [Commits to GitHub repository](https://github.com/LacledesLAN/gamesvr-goldsource)