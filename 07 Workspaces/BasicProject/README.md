## Intialize Terraform:
```bash
    terraform init
    terraform validate
```

## Create Workspaces:

```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
```
## Switch to a Workspace and Apply Configuration:

```bash
terraform workspace select dev
terraform apply
```
This will create an EC2 instance with the t3.micro type for the dev workspace.

## Switch to Another Workspace and Apply Configuration:

```bash
terraform workspace select prod
terraform apply
```
This will create an EC2 instance with the t3.large type for the prod workspace.