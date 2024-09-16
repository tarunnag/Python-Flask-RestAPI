#!/bin/bash
set -e

#docker-compose down
#docker-compose up -d
#sleep 60


#docker-compose -f docker-compose1.yml down
#docker-compose -f docker-compose1.yml up -d
#sleep 60

docker pull 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest

docker stop python-container || true
docker rm python-conatiner || true

docker run -d -p 5001:5000 --name python-container 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest

docker stop python-container1 || true
docker rm python-container1 || true

docker run -d -p 5000:5000 --name python-container1 585768149561.dkr.ecr.ap-south-1.amazonaws.com/python-image:latest



