#!/usr/bin/python

import sys
from math import *

if len(sys.argv) < 3:
    sys.exit("Please enter filename and column numbers to filter")

filename = sys.argv[1]
limit    = int(sys.argv[2])

# Load rank list
rank_list = []
with open(filename, 'r') as fh:
    for line in fh:
        line_arr = line.split(",")
        out_arr = [""]
        for i in sys.argv[2:]:
            type(out_arr)
            # print(line_arr)
            out_arr.append(line_arr[i])
        print(out_arr)



# print(out_arr.join(","))
