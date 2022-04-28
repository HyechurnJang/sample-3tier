#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "build.sh <REGISTRY_HOSTNAME_OR_IP>"
    echo ""
    exit 1
fi
REGISTRY=$1

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

cd $WORKDIR
docker rmi -f $REGISTRY/db:v1
docker build --no-cache -t $REGISTRY/db:v1 .
docker push $REGISTRY/db:v1
curl -k -XGET http://$REGISTRY/v2/db/tags/list
docker rmi -f $REGISTRY/db:v1
cd $CURRDIR