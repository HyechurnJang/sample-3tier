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

docker rm -f db
docker rmi -f $REGISTRY/db:v1
docker run --name db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=3tier -p 5432:5432 -d $REGISTRY/db:v1
sleep 1
docker logs db
