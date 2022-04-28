#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

if [ -z "$1" ]; then
    echo "run.sh <REGISTRY_HOSTNAME_OR_IP> <WEB_SERVER_HOST> <WAS_SERVER_HOST>"
    echo ""
    exit 1
fi
if [ -z "$2" ]; then
    echo "run.sh <REGISTRY_HOSTNAME_OR_IP> <WEB_SERVER_HOST> <WAS_SERVER_HOST>"
    echo ""
    exit 1
fi
if [ -z "$3" ]; then
    echo "run.sh <REGISTRY_HOSTNAME_OR_IP> <WEB_SERVER_HOST> <WAS_SERVER_HOST>"
    echo ""
    exit 1
fi
REGISTRY=$1
WEB_SERVER_HOST=$2
WAS_SERVER_HOST=$3

docker rm -f web
docker rmi -f $REGISTRY/web:v1
docker run --name web -p 80:80 -e WEB_SERVER_HOST="$WEB_SERVER_HOST" -e WAS_SERVER_HOST="$WAS_SERVER_HOST" -d $REGISTRY/web:v1
sleep 1
docker logs web
