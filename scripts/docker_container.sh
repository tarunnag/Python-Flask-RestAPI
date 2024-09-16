#!/bin/bash
set -e

/usr/local/bin/docker-compose down
/usr/local/bin/docker-compose up -d
sleep 60


/usr/local/bin/docker-compose -f docker-compose1.yml down
/usr/local/bin/docker-compose -f docker-compose1.yml up -d
sleep 60



