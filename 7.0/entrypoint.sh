#!/bin/sh

set -e


if [ "$1" = 'php-fpm' ]; then
    export TIMEZONE=${TIMEZONE:-Europe/Brussels}

    /usr/local/bin/confd -onetime -backend env
fi

exec "$@"
