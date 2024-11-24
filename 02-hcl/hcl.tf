terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not_managed_by_us"
}

variable "bucket_name" {
  type        = string
  description = "My variable used to set bucket name"
  default     = "my_default_bucket_name"
}

output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

locals {
  local_example = "This is just an example"
}

module "my_module" {
  source = "./module"
}

