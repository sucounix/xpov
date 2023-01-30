#!/usr/bin/env bash


# ECR
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 086951686584.dkr.ecr.eu-central-1.amazonaws.com

echo "Falsk"
docker build -t xpovx-dev .

docker tag xpovx-dev:test 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpovx-dev-falsk-app:latest

docker push 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpovx-dev-falsk-app:latest

echo "Nginx"
docker build -t nginx ./nginx

docker tag nginx:test 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpovx-dev-nginx:latest

docker push 086951686584.dkr.ecr.eu-central-1.amazonaws.com/xpovx-dev-nginx:latest


# # Local Repo.

# echo "Falsk"
# docker build -t xpovx-dev .

# docker tag xpovx-dev-falsk-app:latest xpovx-dev-falsk-app:dev



# echo "Nginx"
# docker build -t nginx ./nginx

# docker tag xpovx-dev-nginx:latest xpovx-dev-nginx:dev
