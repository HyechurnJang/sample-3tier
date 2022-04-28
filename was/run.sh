#!/bin/bash
# Pre-Installed: docker.io
# Pre-Register Host: reg3tier
# Pre-Login Docker to reg3tier

docker run --name was -p 8080:8080 -e POSTGRES_HOST="192.168.1.12" -d reg3tier/was:v1

