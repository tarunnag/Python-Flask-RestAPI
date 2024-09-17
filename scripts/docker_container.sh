#!/bin/bash
set -e

#docker-compose down
#docker-compose up -d
#sleep 60


#docker-compose -f docker-compose1.yml down
#docker-compose -f docker-compose1.yml up -d
#sleep 60
#!/bin/sh

#!/bin/sh


IMAGE_NAME="585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image"
CONTAINER_NAME="python-container"
CONTAINER_NAME_1="python-container1"

# Stop and remove containers if they exist
if [ "$(docker ps -a --filter "name=$CONTAINER_NAME" --format '{{.Names}}')" ]; then
  echo "Stopping and removing $CONTAINER_NAME..."
  docker container stop $CONTAINER_NAME || true
  docker rm $CONTAINER_NAME || true
fi

if [ "$(docker ps -a --filter "name=$CONTAINER_NAME_1" --format '{{.Names}}')" ]; then
  echo "Stopping and removing $CONTAINER_NAME_1..."
  docker container stop $CONTAINER_NAME_1 || true
  docker rm $CONTAINER_NAME_1 || true
fi

# Double-check that containers are removed (necessary for some cases)
if [ "$(docker ps -a --filter "name=$CONTAINER_NAME" --format '{{.Names}}')" ]; then
  echo "Failed to remove $CONTAINER_NAME, force removing it..."
  docker rm -f $CONTAINER_NAME
fi

if [ "$(docker ps -a --filter "name=$CONTAINER_NAME_1" --format '{{.Names}}')" ]; then
  echo "Failed to remove $CONTAINER_NAME_1, force removing it..."
  docker rm -f $CONTAINER_NAME_1
fi

# Remove the image if it exists
if [ "$(docker images -q $IMAGE_NAME)" ]; then
  echo "Docker image $IMAGE_NAME exists. Removing the image..."
  docker rmi -f $IMAGE_NAME:latest
fi

# Pull the latest image
echo "Pulling latest image..."
docker pull $IMAGE_NAME:latest

# Run the containers
echo "Starting $CONTAINER_NAME..."
docker run -d -p 5001:5000 --name $CONTAINER_NAME $IMAGE_NAME:latest

sleep 30

echo "Starting $CONTAINER_NAME_1..."
docker run -d -p 5000:5000 --name $CONTAINER_NAME_1 $IMAGE_NAME:latest



