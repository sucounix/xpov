#!/usr/bin/env bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 086951686584.dkr.ecr.us-east-1.amazonaws.com

# echo "Falsk"
# docker build -t flask .

# docker tag flask:latest 086951686584.dkr.ecr.us-east-1.amazonaws.com/flask:latest

# docker push 086951686584.dkr.ecr.us-east-1.amazonaws.com/flask:latest

echo "Nginx"

docker build -t nginx ./nginx

docker tag nginx:latest 086951686584.dkr.ecr.us-east-1.amazonaws.com/nginx:latest

docker push 086951686584.dkr.ecr.us-east-1.amazonaws.com/nginx:latest