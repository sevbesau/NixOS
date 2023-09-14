#!/usr/bin/env bash

host="$1"
shift

[ -z "$host" ] && echo "No host specified" && exit 2

nixos-rebuild --flake .#$host switch --use-remote-sudo 