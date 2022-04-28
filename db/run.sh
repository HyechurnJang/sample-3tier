#!/bin/bash

WORKDIR=$(dirname $0)

apt install docker.io postgresql-client -y
docker rm -f db
docker run --name db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=3tier -p 5432:5432 -d postgres:13.0
sleep 5
PGPASSWORD=password psql -h localhost -U postgres -d mydb -f $WORKDIR/init.sql