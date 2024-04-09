#!/bin/bash
mkdir -p /opt/factorio/config
cp -r ./config /opt/factorio
chown 845:845 /opt/factorio
sudo docker run -d \
  -p 34197:34197/udp \
  -p 27015:27015/tcp \
  -v /opt/factorio:/factorio \
  -e TOKEN=\
  -e USERNAME=\
  --name factorio \
  --restart=unless-stopped \
  factoriotools/factorio:stable
#https://factorio.com/profile

