#!/usr/bin/env bash

if [[ -z "${ROOTDIR}" ]]; then
  echo "Please set environment variable ROOTDIR"
  exit 1
fi

docker build -t pretix ./pretix

docker run --rm \
	-p "8000:80" \
	-v ${ROOTDIR}/data:/data \
	-v ${ROOTDIR}/conf:/etc/pretix \
	-v /var/run/docker.sock:/var/run/docker.sock \
	pretix;