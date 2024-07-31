#!/bin/bash

# Set the registry path from the argument
REGISTRY="$1"

# Function to build, tag, and push an image
build_tag_push() {
    local image_name=$1
    local dockerfile="${image_name}.Dockerfile"
    
    echo "Processing $image_name..."
    
    # Build the image
    docker build -f $dockerfile -t $image_name:latest .
    if [ $? -ne 0 ]; then
        echo "Failed to build $image_name"
        return 1
    fi
    
    # Tag the image
    docker tag $image_name:latest $REGISTRY/$image_name:latest
    if [ $? -ne 0 ]; then
        echo "Failed to tag $image_name"
        return 1
    fi
    
    # Push the image
    docker push $REGISTRY/$image_name:latest
    if [ $? -ne 0 ]; then
        echo "Failed to push $image_name"
        return 1
    fi
    
    echo "$image_name processed successfully"
    echo "-----------------------------"
}

# Process each image
images=("bootnode" "jsonrpc" "miner")

for image in "${images[@]}"
do
    build_tag_push $image
    if [ $? -ne 0 ]; then
        echo "Error processing $image. Exiting."
        exit 1
    fi
done

echo "All images have been built, tagged, and pushed successfully."