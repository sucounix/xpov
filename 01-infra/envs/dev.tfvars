name                = "xpovx"
environment         = "dev"
availability_zones  = ["eu-central-1a", "eu-central-1b"]
private_subnets     = ["10.0.0.0/20", "10.0.32.0/20"]
public_subnets      = ["10.0.16.0/20", "10.0.48.0/20"]
tsl_certificate_arn = "arn:aws:acm:us-east-1:086951686584:certificate/445a4127-69fb-47a6-9545-c2c9d9b2e93a"
container_memory_0  = 512
container_memory_1  = 512
container_name_0    = "nginx"
container_image_0   = "nginx"
container_name_1    = "falsk-app"
container_image_1   = "falsk-app"
application-secrets = {
  "SOLARIS_WEBHOOK_SECRET" = "my-solaris-webhook-secret"
  "DYNAMO_DB_KEY"          = "my-dynamo-db-key"
  "DYNAMO_DB_SECRET"       = "my-dynamo-db-secret"
  "API_KEY_X"              = "my-api-key"
}

