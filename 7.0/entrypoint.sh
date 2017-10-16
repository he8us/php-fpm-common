#!/bin/sh

set -e

export TIMEZONE=${TIMEZONE:-Europe/Brussels}
/usr/local/bin/confd -onetime -backend env

exec "$@"
