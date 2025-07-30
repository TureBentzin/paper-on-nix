#!/usr/bin/env bash

set -e

echo "DEBUG: /usr/bin/env"

if [ -z $CONTACT]; then
  echo "ERROR: Due to papermc terms, a valid contact needs to be provided. See: https://docs.papermc.io/misc/downloads-api/#_top"
  exit 2
fi

AGENT="paper-on-nix/1.0 ($CONTACT)"
PROJECT="paper"

echo "Downloading $build of $version@$project from $host"

$wget --user-agent="$AGENT" ${host}/v3/projects/${PROJECT}/versions/${version}/builds/${build}

# TODO: Verify hash
