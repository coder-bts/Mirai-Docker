FROM alpine:latest

ENV TZ Asia/Shanghai
ARG MCL_LINK=https://www.bitznet.app/dev/mcl-1.1.0-beta.1.zip
ARG MAH_LINK=https://github.com/project-mirai/mirai-api-http/releases/download/v2.0-RC2/mirai-api-http-v2.0-RC2.mirai.jar
WORKDIR /app

RUN apk --no-cache add openjdk11-jre wget &&\
    mkdir /app/plugins &&\
    wget ${MCL_LINK} -O /app/mcl.zip &&\
    wget -P /app/plugins ${MAH_LINK} &&\
    unzip mcl.zip &&\
    chmod +x mcl &&\
    ./mcl --dry-run

EXPOSE 8080

CMD ["./mcl"]
