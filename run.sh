#!/bin/bash

# Load config variables
source config.sh

# Message
echo "Caputured items will be removed from the list.."

# Capture screenshots for each in list
# for item in `cat list.txt`;
for item in `cat resources/top-1m.csv`;

do 
    rank=${item%,*}
    url=https://${item#*,}
    filename=${rank}_${item#*,}

    # sed '1d' ${INPUT_LIST} > tmp.txt
    # mv tmp.txt ${INPUT_LIST}

    if [ "$rank" -gt "$1" ]; then
        timeout 20 phantomjs siteshot/siteshot-single.js ${url} ${filename}
    fi
done