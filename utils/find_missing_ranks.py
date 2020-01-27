#!/usr/bin/python

import sys
from math import *

if len(sys.argv) < 3:
    sys.exit("Please enter filename and rank limit as an argument")

filename = sys.argv[1]
limit    = int(sys.argv[2])

# Load rank list
rank_list = []
with open(filename, 'r') as fh:
    for line in fh:
        if line.strip() != "": 
            rank_list.append(int(line))

# Check missings
for rank in range(1, limit):
    if rank not in rank_list:
        print(rank)


