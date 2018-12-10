#!/usr/bin/env python3

import sys, os
import cv2
import numpy as np
import matplotlib.pyplot as plt

# Validate inputs
if (len(sys.argv) == 1):
	print("usage: prepare_image_dataset.py directory")
	exit(0)

# Process image
def processImage(img):
	imgray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	imcolor = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
	
	ret, thresh = cv2.threshold(imgray, 127, 255, 0)
	im2, contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
	return imgray


# Load image
path = sys.argv[1]
img = cv2.imread(path)
dataset = processImage(img).ravel().astype(int)

# Dataset to string
datasetStr = ",".join(dataset.astype(str))
print(datasetStr)