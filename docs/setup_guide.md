# CloudGuard Setup Guide

1. Clone this repository.
2. Initialize Terraform:
   ```bash
   cd terraform/environments/dev
   terraform init
   terraform plan
Run OPA policy tests:
opa test opa/policies/ -v

