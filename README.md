# PandoraNext-TokensTool修改版

## 简介

基于 [PandoraNext-TokensTool](https://github.com/Yanyutin753/PandoraNext-TokensTool) 制作。
pandoara_Ip值可用域名代替


### Docker Compose部署详情
## 代码模板
```
version: '3'
services:
  tokensTool:
    image: yangclivia/tokenstool:latest
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
      - --deployWay=(部署方式看环境变量)
      - --deployPosition=/data
      - --hotReload=true
      - --server.port=8081
      - --pandoara_Ip=你的Pandoara部署的服务器外网Ip Or default
```





