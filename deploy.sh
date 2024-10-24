#!/bin/bash

# Build the Docker image with explicit platform and buildx
docker buildx create --use
docker buildx build --load -t relay-server:latest .

# Generate the timestamp for the tag
TIMESTAMP=$(date +%Y%m%d%H%M%S)
TAG="alexay124334/relay-server:v$TIMESTAMP"

# Tag the image
docker tag relay-server:latest $TAG

# Print the build name (tag)
echo "Build created with tag: $TAG"

# Push the image
docker push $TAG

# Print the Docker pull and run commands
echo "To pull and run this image, use the following commands:"
echo "docker pull $TAG"
echo "docker run -d --restart unless-stopped -p 80:8081 $TAG"
