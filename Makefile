# Variables
IMAGE_NAME=my-python-app
CONTAINER_NAME=my-python-app-container

# Build the Docker image
build:
    docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
    docker run --name $(CONTAINER_NAME) -d $(IMAGE_NAME)

# Stop the Docker container
stop:
    docker stop $(CONTAINER_NAME)

# Remove the Docker container
clean:
    docker rm $(CONTAINER_NAME)

# Rebuild the Docker image and run the container
rebuild: stop clean build run