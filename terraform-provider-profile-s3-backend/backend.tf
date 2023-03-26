terraform {
  backend "s3" {
    bucket         = "terraform-provider-profile-s3-backend-state"
    dynamodb_table = "terraform-locking-table"
    encrypt        = true
    key            = "terraform.tfstate"
    profile        = "DevelopmentPowerUserTerraform"
    region         = "ap-southeast-2"
  }
}
