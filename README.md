# AWS Single Sign-on (SSO), Terraform and Terragrunt

This repo contains the code examples provided in the Medium article [AWS Single Sign-on (SSO), Terraform and Terragrunt](https://medium.com/@oliver.schenk/aws-single-sign-on-terraform-and-terragrunt-a8c22bb7cfa8).

The code provided demonstrates the use of AWS profiles when using either Terraform or Terragrunt with the environment variable method or the Terraform provider block method. Although this specific article is regarding configuration of AWS profiles when using SSO with IAM Identity Center, it works with standard credential profiles (access key and secret access key) as well.

Both the Terraform and Terragrunt methods are very similar. In both cases you can set the `AWS_PROFILE` environment variable with the desired profile.

Alternatively, you can use a provider block in Terraform or generate a provider block in Terragrunt. With Terragrunt you also have the option of loading variables via external YAML files.

You'll find the code for each of the four methods in a sub-folder. They will simply deploy a common SSM parameter using the common `ssm-string-parameter` module.

## CI/CD Considerations

The method presented here is specifically for a user who is manually deploying infrastructure with Terraform or Terragrunt from their local development machine. In a proper CI/CD environment you might use this method only for bootstrapping the initial CI/CD pipeline and roles. Any future change would be done through Git commits and the CI/CD pipeline (for example CodePipeline and CodeBuild) would then assume the necessary roles to automatically deploy infrastructure using Terraform or Terragrunt.

## Destroying

You can destroy any resources you created by using the `destroy.sh` script.