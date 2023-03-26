terraform {
  source = "../modules//ssm-string-parameter"
}

inputs = {
  name = "profile-type-tg-env"
  value = "Terragrunt with environment variable profile"
}