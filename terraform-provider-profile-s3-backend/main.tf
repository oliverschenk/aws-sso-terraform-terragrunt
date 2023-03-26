module "ssm_parameter_foo" {
  source = "../modules//ssm-string-parameter"

  name  = "profile-type-tf-provider-s3"
  value = "Terraform with profile in provider block with S3 backend"
}
