#!/bin/bash
rm -f /home/ubuntu/appspec.yml
rm -f /home/ubuntu/buildspec.yml
rmdir -r /home/ubuntu/scripts


docker-compose down
docker-compose up -d
sleep 60


docker-compose -f docker-compose1.yml down
docker-compose -f docker-compose1.yml up -d
sleep 60



