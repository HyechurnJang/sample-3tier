#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "build.sh <WEB_SERVER_HOST>"
    echo ""
    exit 1
fi
export WEB_SERVER_HOST=$1

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

cd $WORKDIR
docker rmi -f jzidea/sample-3tier-web:v1
envsubst '${WEB_SERVER_HOST}' < $WORKDIR/src/http-common.js.template > $WORKDIR/src/http-common.js
docker build --no-cache -t jzidea/sample-3tier-web:v1 .
cd $CURRDIR