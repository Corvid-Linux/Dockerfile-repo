[![Corvid](https://user-images.githubusercontent.com/73482535/138620936-111d3a40-127b-4e38-9f05-e62074a1da9e.jpg)](https://github.com/Ashraf-wan/Corvid)

[![Discord](https://img.shields.io/discord/902002814656606249?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://discord.gg/7JVx2jbweN "realtime support / chat with the community and the team.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Ashraf-wan&message=GitHub&logo=github)](https://github.com/Ashraf-wan "view the source for all of our repositories.")

## Running Container

```
git clone https://github.com/Corvid-Linux/Dockerfile-repo
cd Dockerfile-repo
docker build -t corvidlinux .
docker run -it -d --name=corvid corvidlinux /bin/bash
docker exec -it corvid bash
```
