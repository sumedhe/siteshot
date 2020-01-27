#!/bin/bash

for item in $(ls -1tr ${1})
do
    rank=${item%_*}
    if [ "y" == "$2" ]; then
        echo $(printf "%04d" $rank)
    else
        echo ${rank}
    fi
done
