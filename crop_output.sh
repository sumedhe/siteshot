#!/bin/bash

SIZE=3360x2100
INPUT_DIR=input
OUTPUT_DIR=output

# Load config variables
# source config.sh

# For each output image
mkdir -p ${OUTPUT_DIR}
for item in $(ls -1tr ${INPUT_DIR})
do
    echo ${item}
    convert ${INPUT_DIR}/${item} -gravity west -crop ${SIZE}+0+190 ${OUTPUT_DIR}/${item}
done