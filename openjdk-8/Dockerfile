FROM arm64v8/openjdk:8-jdk-alpine
WORKDIR /home/container
RUN apk update \
    && apk add --no-cache lsof curl ca-certificates openssl git tar sqlite fontconfig libstdc++ tzdata iproute2 \
    && adduser -D -h /home/container container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
USER container
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
