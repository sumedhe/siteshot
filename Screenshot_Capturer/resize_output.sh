#!/bin/bash

SIZE=1600x1200
OUTPUT_DIR=output_resized_${SIZE}

# Load config variables
source config.sh

# For each output image
mkdir -p ${OUTPUT_DIR}
for item in $(ls ${OUTPUT_DIR})
do
    echo $i
    convert output/${item} -gravity north -crop ${SIZE}+0+0 ${OUTPUT_DIR}/${item}
done