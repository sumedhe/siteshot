#!/bin/bash

WORKSPACE_DIR=workspace
CAPTURED_DIR=${WORKSPACE_DIR}/captured
CROPPED_DIR=${WORKSPACE_DIR}/cropped

SIZE=3360x2100

# Load config variables
# source config.sh

# For each output image
for item in $(ls -1tr ${CAPTURED_DIR})
do
    echo ${item}
    convert ${CAPTURED_DIR}/${item} -gravity west -crop ${SIZE}+0+150 ${CROPPED_DIR}/${item}
done
