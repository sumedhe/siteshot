#!/bin/bash

WORKSPACE_DIR=workspace
CAPTURED_DIR=${WORKSPACE_DIR}/captured
URL_LIST=resources/top-1m.csv

INTERVAL=20

# Message
echo "Caputured items will be removed from the list.."

# Capture screenshots for each in list
# for item in `cat list.txt`;
for item in `cat ${URL_LIST}`;

do 
    rank=${item%,*}
    url=https://${item#*,}
    filename=${CAPTURED_DIR}/${rank}_${item#*,}

    # sed '1d' ${INPUT_LIST} > tmp.txt
    # mv tmp.txt ${INPUT_LIST}

    if [ "$rank" -gt "$1" ]; then
        open ${url}
        sleep ${INTERVAL}
        # open ${url} && sleep 1 # Switch to window before capturing
        screencapture -x ${filename}.png
    fi
done
