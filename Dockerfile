# 使用 AdoptOpenJDK 提供的多平台 OpenJDK 11 镜像
FROM adoptopenjdk/openjdk11:jdk-11.0.21_9-debian-slim

# 指定维护者的名字
#MAINTAINER Yanyutin753

# 安装 procps 和 docker 包，其中包含 pkill 命令，并清理APT缓存
RUN apt-get update \
    && apt-get install -y procps docker.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 复制JAR文件到容器的/app目录下
COPY /simplyDeploy/tokenstool-0.4.7.3.jar /app/app.jar

# 切换到/app目录
WORKDIR /app

# 声明服务运行在8081端口
EXPOSE 8081

#声明环境变量
ENV pandoara_Ip=""
ENV deployWay="docker"
ENV deployPosition=""
ENV port="8081"
ENV hotReload="true"

#指定docker容器启动时运行jar包
ENTRYPOINT ["java","-jar","app.jar","--server.port=${port}","--deployWay=${deployWay}", "--deployPosition=${deployPosition}","--hotReload=${hotReload}", "--pandoara_Ip=${pandoara_Ip}"]

