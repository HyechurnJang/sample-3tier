#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "build.sh <REGISTRY_HOSTNAME_OR_IP> <SERVICE>"
    echo ""
    exit 1
fi
if [ -z "$2" ]; then
    echo "build.sh <REGISTRY_HOSTNAME_OR_IP> <SERVICE>"
    echo ""
    exit 1
fi
REGISTRY=$1
SERVICE=$2

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

cd $WORKDIR/../$SERVICE
docker rmi -f $REGISTRY/$SERVICE:v1
docker build --no-cache -t $REGISTRY/$SERVICE:v1 .
docker push $REGISTRY/$SERVICE:v1
curl -k -XGET http://$REGISTRY/v2/$SERVICE/tags/list
docker rmi -f $REGISTRY/$SERVICE:v1
cd $CURRDIR