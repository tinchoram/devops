#!/bin/bash

# read base image
BASE_IMAGE_NAME=$(awk 'NR==1' base_image.txt)
BASE_IMAGE_TAG=$(awk 'NR==2' base_image.txt)

# clone repo
git clone https://github.com/nrupendesai/debugApp.git
cd debugApp

# Set image in Dockerfile
sed -i '' "s|^FROM .*|FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}|" Dockerfile

# build Docker image
docker build -t debugapp:latest .
