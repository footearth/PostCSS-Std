#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

set -e

pjName="PostCSS-Std"

docker run \
  --name ${pjName} \
  --rm \
  -ti \
  -v ${cwd}:/root/${pjName} \
  -p 8080:8080 \
  mooxe/node \
  /bin/bash
