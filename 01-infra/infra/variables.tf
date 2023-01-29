variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
  default     = "prod"
}

variable "region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
  default     = "eu-central-1"
}

variable "aws-region" {
  type        = string
  description = "AWS region to launch servers."
  default     = "eu-central-1"
}

variable "aws-access-key" {
  type = string
}

variable "aws-secret-key" {
  type = string
}

variable "application-secrets" {
  description = "A map of secrets that is passed into the application. Formatted like ENV_VAR = VALUE"
  type        = map
}


variable "availability_zones" {
  description = "a comma-separated list of availability zones, defaults to all AZ of the region, if set to something other than the defaults, both private_subnets and public_subnets have to be defined as well"
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "a list of CIDRs for private subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  default     = ["10.0.0.0/20", "10.0.32.0/20", "10.0.64.0/20"]
}

variable "public_subnets" {
  description = "a list of CIDRs for public subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  default     = ["10.0.16.0/20", "10.0.48.0/20", "10.0.80.0/20"]
}

variable "service_desired_count" {
  description = "Number of tasks running in parallel"
  default     = 2
}

variable "container_name_0" {
  description = "name of container"
}
variable "container_port_0" {
  description = "The port where the Docker is exposed"
  default     = 80
}

variable "container_cpu_0" {
  description = "The number of cpu units used by the task"
  default     = 256
}

variable "container_memory_0" {
  description = "The amount (in MiB) of memory used by the task"
  default     = 512
}

variable "container_name_1" {
  description = "name of container"
}

variable "container_port_1" {
  description = "Port of container"
  default     = 5000
}

variable "container_cpu_1" {
  description = "The number of cpu units used by the task"
  default     = 256
}

variable "container_memory_1" {
  description = "The amount (in MiB) of memory used by the task"
  default     = 512
}



variable "health_check_path" {
  description = "Http path for task health check"
  default     = "/health"
}

variable "tsl_certificate_arn" {
  description = "The ARN of the certificate that the ALB uses for https"
}

variable "container_image_0" {
  description = "Docker image to be launched"
}
variable "container_image_1" {
  description = "the name of your stack, e.g. \"demo\""
}
