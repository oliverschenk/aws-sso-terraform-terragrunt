terraform {
  source = "../modules//ssm-string-parameter"
}

locals {
  common_vars = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

# Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "${local.common_vars.region}"
  profile = "${local.common_vars.profile_with_s3}"
}
EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "terragrunt-provider-profile-s3-backend-state"
    key            = "terraform.tfstate"
    region         = local.common_vars.region
    profile        = local.common_vars.profile_with_s3
    encrypt        = true
    dynamodb_table = "terraform-locking-table"
    s3_bucket_tags = {
      owner = "terraform"
      name  = "Terraform state storage"
    }
    dynamodb_table_tags = {
      owner = "terraform"
      name  = "terraform-locking-table"
    }
  }
  generate = {    
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

inputs = {
  name = "profile-type-tg-provider-s3"
  value = "Terragrunt with generated provider block and config file with S3 backend"
}