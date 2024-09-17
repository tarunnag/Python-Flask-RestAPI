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

# Replace 'image_name' with the name of the Docker image you're looking for
IMAGE_NAME="pull 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image"

# Check if the image exists
if [ "$(docker images -q $IMAGE_NAME)" ]; then
  echo "Docker image $IMAGE_NAME exists."
  docker rmi $IMAGE_NAME:latest
  docker pull 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest
else
  echo "Docker image $IMAGE_NAME does not exist."
  docker pull 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest
fi



CONTAINER_NAME="python-container"

# Check if the container exists (both running and stopped containers)
if [ "$(docker ps -a --filter "name=$CONTAINER_NAME" --format '{{.Names}}')" ]; then
  echo "Container $CONTAINER_NAME exists."
  docker container stop python-container || true
  docker rm python-container || true  
  docker run -d -p 5001:5000 --name python-container 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest
else
  echo "Container $CONTAINER_NAME does not exist."
  docker run -d -p 5001:5000 --name python-container 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest
fi

sleep 30
#!/bin/sh

# Replace 'container_name' with the name or ID of your container
CONTAINER_NAME_1="python-container1"

# Check if the container exists (both running and stopped containers)
if [ "$(docker ps -a --filter "name=$CONTAINER_NAME_1" --format '{{.Names}}')" ]; then
  echo "Container $CONTAINER_NAME_1 exists."
  docker container stop python-container1 || true
  docker rm python-container1 || true
  docker run -d -p 5000:5000 --name python-container1 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest
else
  echo "Container $CONTAINER_NAME_1 does not exist."
  docker run -d -p 5000:5000 --name python-container1 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest
fi

sleep 30








