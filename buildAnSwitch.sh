#!/usr/bin/env bash

host="$1"
shift

[ -z "$host" ] && host="$(hostname)"

nixos-rebuild --flake .#$host switch --use-remote-sudo 