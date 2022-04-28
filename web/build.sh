#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "build.sh <REGISTRY_HOSTNAME_OR_IP> <WEB_SERVER_HOST>"
    echo ""
    exit 1
fi
if [ -z "$2" ]; then
    echo "build.sh <REGISTRY_HOSTNAME_OR_IP> <WEB_SERVER_HOST>"
    echo ""
    exit 1
fi
REGISTRY=$1
WEB_SERVER_HOST=$2

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

cd $WORKDIR
docker rmi -f $REGISTRY/web:v1
envsubst '${WEB_SERVER_HOST}' < $WORKDIR/src/http-common-js.template > $WORKDIR/src/http-common-js
docker build --no-cache -t $REGISTRY/web:v1 .
docker push $REGISTRY/web:v1
curl -k -XGET http://$REGISTRY/v2/web/tags/list
docker rmi -f $REGISTRY/web:v1
cd $CURRDIR