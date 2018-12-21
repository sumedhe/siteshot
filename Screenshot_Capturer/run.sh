#!/bin/bash

# Load config variables
source config.sh

# Message
echo "Caputured items will be removed from the list.."

# Capture screenshots for each in list
for item in `cat list.txt`;
do 
    sed '1d' ${INPUT_LIST} > tmp.txt
    mv tmp.txt ${INPUT_LIST}
    ${PHANTOMJS_DIR}/phantomjs siteshot/siteshot-single.js $item
done