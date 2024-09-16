
CONTAINER_NAME="python-app"  # Replace with your container's name
CONTAINER_NAME1="python-app-1"

container_id=$(docker ps -q -f name=$CONTAINER_NAME)
container_id_1=$(docker ps -q -f name=$CONTAINER_NAME1)

if [ -n "$container_id" ]; then
    echo "Container '$CONTAINER_NAME' is running."
else
    echo "Container '$CONTAINER_NAME' is not running or does not exist."
    exit 1
fi

if [ -n "$container_id_1" ]; then
    echo "Container '$CONTAINER_NAME1' is running."
else
    echo "Container '$CONTAINER_NAME1' is not running or does not exist."
    exit 1
fi