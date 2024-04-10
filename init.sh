#!/bin/bash
mkdir -p /opt/factorio/config
cp -r ./config /opt/factorio
chown 845:845 /opt/factorio
echo "Enter factorio username: "
read factorio_username
echo "Enter user token (https://factorio.com/profile): "
read factorio_token

sudo docker run -d \
  -p 34197:34197/udp \
  -p 27015:27015/tcp \
  -v /opt/factorio:/factorio \
  -e TOKEN=$factorio_token\
  -e USERNAME=$factorio_username\
  --name factorio \
  --restart=unless-stopped \
  factoriotools/factorio:stable


