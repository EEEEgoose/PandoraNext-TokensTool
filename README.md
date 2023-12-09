# PandoraNext-TokensTool修改版

## 简介

基于 [PandoraNext-TokensTool](https://github.com/Yanyutin753/PandoraNext-TokensTool) 制作。
pandoara_Ip值可用域名代替


### 拉取镜像
```
docker pull ghcr.io/eeeegoose/pandoranext-tokenstool:latest
```


### Docker Compose部署详情 一键部署pandora-next和Tokenstool
## 代码模板
```
version: '3'
services:
  pandora-next:
    image: pengzhile/pandora-next:latest
    container_name: PandoraNext
    networks:
      - pandora_network
    restart: always
    ports:
      - "8080:8080"
    volumes:
      - ./data:/data
      - ./sessions:/root/.cache/PandoraNext

services:
  tokensTool:
    image: ghcr.io/eeeegoose/pandoranext-tokenstool:latest
    container_name: tokensTool
    restart: always
    user: root
    network_mode: host
    pid: host
    privileged: true
    volumes:
      - （你config.json的文件目录）:/data
      - /var/run/docker.sock:/var/run/docker.sock
    command:
      - --deployWay=docker
      - --deployPosition=/data
      - --hotReload="true"
      - --server.port=8081
      - --pandoara_Ip=https://XXX.XXX

networks:
  pandora_network:
    driver: bridge
```





