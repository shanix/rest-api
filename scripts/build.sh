#!/usr/bin/env bash
#
# Builds the REST API.
#
# Executes from top-level dir
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../
. "$DIR"/env.sh || exit 1

buildr test=no p --silent $@ 

