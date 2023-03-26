module "ssm_parameter_foo" {
  source = "../modules//ssm-string-parameter"

  name  = "profile-type-tf-env"
  value = "Terraform with environment variable profile"
}
