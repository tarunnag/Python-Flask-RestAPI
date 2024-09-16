set -e

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 585768149561.dkr.ecr.ap-south-1.amazonaws.com

#!/bin/bash
rm -f /home/ubuntu/appspec.yml
rm -f /home/ubuntu/buildspec.yml
rmdir -r /home/ubuntu/scripts