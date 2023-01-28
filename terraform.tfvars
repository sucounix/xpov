# app/env to scaffold
app = "xpov-flask-app"
environment = "dev"

internal = true
container_port = "5000"
replicas = "1"
health_check = "/health"
region = "us-east-1"
aws_profile = "default"
saml_role = "xpov-admin"
vpc = "vpc"
private_subnets = "private-subnet-1,private-subnet-2"
public_subnets = "public-subnet-1,public-subnet-2"
tags = {
  application   = "xpov-flask-app"
  environment   = "dev"
  team          = "xpov"
  customer      = "xpov"
  contact-email = "suco@example.com"
}