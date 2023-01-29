variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "region" {
  description = "the AWS region in which resources are created"
}

variable "subnets" {
  description = "List of subnet IDs"
}

variable "ecs_service_security_groups" {
  description = "Comma separated list of security groups"
}
variable "container_name_0" {
  description = "name of container"
}
variable "container_port_0" {
  description = "Port of container"
}

variable "container_cpu_0" {
  description = "The number of cpu units used by the task"
}

variable "container_memory_0" {
  description = "The amount (in MiB) of memory used by the task"
}

variable "container_image_0" {
  description = "Docker image to be launched"
}

variable "container_name_1" {
  description = "name of container"
}
variable "container_port_1" {
  description = "Port of container"
}

variable "container_cpu_1" {
  description = "The number of cpu units used by the task"
}

variable "container_memory_1" {
  description = "The amount (in MiB) of memory used by the task"
}

variable "container_image_1" {
  description = "Docker image to be launched"
}


variable "aws_alb_target_group_arn" {
  description = "ARN of the alb target group"
}

variable "service_desired_count" {
  description = "Number of services running in parallel"
}

variable "container_environment" {
  description = "The container environmnent variables"
  type        = list
}

variable "container_secrets" {
  description = "The container secret environmnent variables"
  type        = list
}

variable "container_secrets_arns" {
  description = "ARN for secrets"
}
