#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

CURRDIR=$(pwd)
WORKDIR=$(dirname $0)

cd $WORKDIR
docker rmi -f jzidea/sample-3tier-was:v1
docker build --no-cache -t jzidea/sample-3tier-was:v1 .
cd $CURRDIR