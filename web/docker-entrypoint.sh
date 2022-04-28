#!/usr/bin/env sh
set -eu
envsubst '${WAS_SERVER_HOST}' < /tmp/nginx-default.conf.template > /etc/nginx/conf.d/default.conf
exec "$@"
