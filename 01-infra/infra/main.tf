provider "aws" {
  access_key = var.aws-access-key
  secret_key = var.aws-secret-key
  region     = var.aws-region
  version    = "~> 2.0"
}

# terraform {
#   backend "s3" {
#     # bucket  = "tf-state-xpov-dev"
#     # encrypt = true
#     # key     = "terraform.tfstate"
#     # region  = "us-east-1"
#     # dynamodb_table = "terraform-state-lock-dynamo" - uncomment this line once the terraform-state-lock-dynamo has been terraformed
#   }
# }

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

module "vpc" {
  source             = "./vpc"
  name               = var.name
  cidr               = var.cidr
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
  environment        = var.environment
}

module "security_groups" {
  source         = "./security-groups"
  name           = var.name
  vpc_id         = module.vpc.id
  environment    = var.environment
  container_port = var.container_port_0
}

module "alb" {
  source              = "./alb"
  name                = var.name
  vpc_id              = module.vpc.id
  subnets             = module.vpc.public_subnets
  environment         = var.environment
  alb_security_groups = [module.security_groups.alb]
  # alb_tls_cert_arn    = var.tsl_certificate_arn
  health_check_path   = var.health_check_path
}

module "ecr" {
  source      = "./ecr"
  name        = var.name
  environment = var.environment
  container_name_0 =var.container_name_0
  container_name_1 =var.container_name_1
}


module "secrets" {
  source              = "./secrets"
  name                = var.name
  environment         = var.environment
  application-secrets = var.application-secrets
}

module "ecs" {
  source                      = "./ecs"
  name                        = var.name
  environment                 = var.environment
  region                      = var.aws-region
  subnets                     = module.vpc.private_subnets
  aws_alb_target_group_arn    = module.alb.aws_alb_target_group_arn
  ecs_service_security_groups = [module.security_groups.ecs_tasks]
  container_name_0            = var.container_name_0
  container_port_0            = var.container_port_0
  container_cpu_0             = var.container_cpu_0
  container_memory_0          = var.container_memory_0
  container_name_1            = var.container_name_1
  container_port_1            = var.container_port_1
  container_cpu_1             = var.container_cpu_1
  container_memory_1          = var.container_memory_1

  service_desired_count       = var.service_desired_count
  container_environment = [
    { name = "LOG_LEVEL",
    value = "DEBUG" },
    { name = "PORT",
    value = var.container_port_0 }
  ]
  container_secrets      = module.secrets.secrets_map
  container_image_0 = module.ecr.aws_ecr_repository_url
  container_image_1 = module.ecr.aws_ecr_repository_url_container_name_1
  container_secrets_arns = module.secrets.application_secrets_arn
}