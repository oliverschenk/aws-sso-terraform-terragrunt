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
  profile = "${local.common_vars.profile}"
}
EOF
}

inputs = {
  name = "profile-type-tg-provider"
  value = "Terragrunt with generated provider block and config file"
}