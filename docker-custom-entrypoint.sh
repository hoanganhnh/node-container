#!/bin/bash
set -e

USER=node

function run_command() {
	if ! [ $(id -u) = 0 ]; then
		sudo -ES su -c "$1"
	else
		$1
	fi
}

run_command "update-ca-certificates"

if [ -n "$UID" ] && [ -n "$GID" ]; then
    if ! [ $(id -u) = 0 ]; then
	    run_command "usermod $USER -o -u $UID && groupmod $USER -o -g $GID"
    fi
fi

exec docker-entrypoint.sh "$@"