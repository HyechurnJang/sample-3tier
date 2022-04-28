#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "run.sh <REGISTRY_HOSTNAME_OR_IP> <DATABASE_HOSTNAME_OR_IP>"
    echo ""
    exit 1
fi
if [ -z "$2" ]; then
    echo "run.sh <REGISTRY_HOSTNAME_OR_IP> <DATABASE_HOSTNAME_OR_IP>"
    echo ""
    exit 1
fi
REGISTRY=$1
DATABASE=$2

docker rm -f was
docker run --name was -p 8080:8080 -e POSTGRES_HOST="$DATABASE" -d $REGISTRY/was:v1
sleep 1
docker logs was
