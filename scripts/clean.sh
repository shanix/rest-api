#!/usr/bin/env bash
#
# Cleans the current build.
#
# Executes from top-level dir
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../
. "$DIR"/env.sh || exit 1

buildr test=no c --silent $@

