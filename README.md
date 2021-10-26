[![Corvid](https://user-images.githubusercontent.com/73482535/138620936-111d3a40-127b-4e38-9f05-e62074a1da9e.jpg)](https://github.com/Ashraf-wan/Corvid)

[![Discord](https://img.shields.io/discord/902002814656606249?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://discord.gg/7JVx2jbweN "realtime support / chat with the community and the team.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Ashraf-wan&message=GitHub&logo=github)](https://github.com/Ashraf-wan "view the source for all of our repositories.")

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose (recommended, [click here for more info](https://docs.linuxserver.io/general/docker-compose))

```yaml
---
version: "1"
services:
  corvid:
    image: parrotsecurity/corvid
    container_name: corvid
    privileged: true #optional
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - SUBFOLDER=/ #optional
    volumes:
      - /corvid:/root
      - /var/run/docker.sock:/var/run/docker.sock #optional
    ports:
      - 3000:3000
    restart: unless-stopped
```

### docker cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```bash
docker run -d \
  --name=corvid \
  --privileged `#optional` \
  --security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e SUBFOLDER=/ `#optional` \
  -p 3000:3000 \
  -v /corvid:/root \
  -v /var/run/docker.sock:/var/run/docker.sock `#optional` \
  --restart unless-stopped \
  parrotsecurity/corvid
```
### Screenshots

Xfce DE:
