module "ssm_parameter_foo" {
  source = "../modules//ssm-string-parameter"

  name  = "profile-type-tf-provider"
  value = "Terraform with profile in provider block"
}
