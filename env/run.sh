#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

mkdir -p /opt/registry
docker rm -f registry
rm -rf /opt/registry/*
docker run -d -p 5000:5000 --restart=always --name registry -v /opt/registry:/registry -e "REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/registry" registry:2.7.0

cd $WORKDIR/../was
docker build --no-cache -t reg3tier/was:v1 .
docker push reg3tier/was:v1


cd $CURRDIR