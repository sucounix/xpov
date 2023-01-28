#!/usr/bin/env bash

aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 086951686584.dkr.ecr.eu-central-1.amazonaws.com

echo "Falsk"
docker build -t xpov-dev .

docker tag xpov-dev:latest 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpov-dev-falsk-app:latest

docker push 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpov-dev-falsk-app:latest

echo "Nginx"
docker build -t nginx ./nginx

docker tag nginx:latest 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpov-dev-nginx:latest

docker push 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpov-dev-nginx:latest