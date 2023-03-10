terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
}

/**
 * main.tf
 * The main entry point for Terraform run
 * See variables.tf for common variables
 * See ecr.tf for creation of Elastic Container Registry for all environments
 * See state.tf for creation of S3 bucket for remote state
 */

# Using the AWS Provider
# https://www.terraform.io/docs/providers/
provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

/*
 * Outputs
 * Results from a successful Terraform run (terraform apply)
 * To see results after a successful run, use `terraform output [name]`
 */

# Returns the name of the S3 bucket that will be used in later Terraform files
output "bucket" {
  value = module.tf_remote_state.bucket
}
