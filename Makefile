# Variables
IMAGE_NAME=my-python-app
CONTAINER_NAME=my-python-app-container

# Build the Docker image
build:
	docker build --no-cache -t $(IMAGE_NAME) .

# Run the Docker container (Flask inicia automaticamente)
run:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	docker run --rm -d -p 8080:8080 --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Attach to the running container
shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh

# Stop the Docker container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Docker container
clean:
	docker rm $(CONTAINER_NAME) || true

# Rebuild the Docker image and run the container
rebuild: stop clean build run
