# Amazon Elastic Container Registry

enabled = true
name = "apps-ecr"
environment = "dev"
namespace = "xpov"
stage = "test"
image_names  = ["flask", "nginx"]
# encryption_configuration = {
#   encryption_type = "AES256"
#   kms_key         = null
# }