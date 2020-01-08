#!/bin/bash

# Load config variables
source config.sh

# Message
echo "Caputured items will be removed from the list.."

# Capture screenshots for each in list
# for item in `cat list.txt`;
for item in `cat resources/retake.csv`;

do 
    rank=${item%,*}
    url=https://${item#*,}
    filename=output2/${rank}_${item#*,}

    # sed '1d' ${INPUT_LIST} > tmp.txt
    # mv tmp.txt ${INPUT_LIST}

    if [ "$rank" -gt "$1" ]; then
        open ${url}
        sleep 30
        # open ${url} && sleep 1 # Switch to window before capturing
        screencapture -x ${filename}.png
    fi
done
