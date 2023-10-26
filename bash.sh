#!/bin/bash
docker run --privileged --rm tonistiigi/binfmt --install all
# Build the Docker image
docker build --platform linux/amd64 -t lamdba_test .

# Create a temporary container
docker create --name temp-container lamdba_test

# Copy files from the container to a local directory
docker cp temp-container:/app - | tar xv -C /Users/Sai.Damarla/Downloads

# Remove the temporary container
docker rm temp-container