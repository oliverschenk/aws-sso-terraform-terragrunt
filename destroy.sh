#!/bin/bash

echo "Destroying all resources created in this project"

pushd ./terraform-env-var-profile
terraform destroy -auto-approve 
popd

pushd ./terraform-provider-profile
terraform destroy -auto-approve 
popd

pushd ./terraform-provider-profile-s3-backend
terragrunt destroy -auto-approve 
popd

pushd ./terragrunt-env-var-profile
terragrunt destroy -auto-approve 
popd

pushd ./terragrunt-provider-profile
terragrunt destroy -auto-approve 
popd

pushd ./terragrunt-provider-profile-s3-backend
terragrunt destroy -auto-approve 
popd

echo "Destroy completed!"