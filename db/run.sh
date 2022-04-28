#!/bin/bash

apt install postgresql-client -y
docker run --name db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=3tier -p 5432:5432 -d postgres:13.0

