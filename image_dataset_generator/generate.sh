#!/bin/bash

for i in $(ls $1);
do echo Loading $i; ./image_to_array.py ../screenshots/$i >> dataset.csv;
done;