#!/bin/bash

set -e
source ${PWD}/etc/pngx/env

CONTAINER_SAVE_DIR=${PWD}/usr/src/containers
CONTAINER_IMAGE_LIST=$(declare |grep _CONTAINER_IMAGE)

for CONTAINER in ${CONTAINER_IMAGE_LIST[@]}; do
  TAG=$(echo ${CONTAINER}|cut -d: -f2)
  CONTAINER_NAME=$(echo ${CONTAINER}|cut -d: -f1|rev|cut -d\/ -f1|rev)
  CONTAINER_REPO=$(echo ${CONTAINER}|cut -d= -f2)
  echo ${CONTAINER_REPO}
  podman save ${CONTAINER_REPO} >| "${CONTAINER_SAVE_DIR}/${CONTAINER_NAME}-${TAG}.tar"
done
