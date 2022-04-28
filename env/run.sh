#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "run.sh <REGISTRY_HOSTNAME_OR_IP>"
    echo ""
    exit 1
fi
REGISTRY=$1

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

mkdir -p /opt/registry
docker rm -f registry
rm -rf /opt/registry/*
docker run -d -p 80:5000 --restart=always --name registry -v /opt/registry:/registry -e "REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/registry" registry:2.7.0

$WORKDIR/build_was.sh $REGISTRY
$WORKDIR/build_web.sh $REGISTRY

