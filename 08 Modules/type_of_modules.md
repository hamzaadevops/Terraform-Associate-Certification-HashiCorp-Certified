# Types of Modules in Terraform
In Terraform, modules are used to organize and reuse infrastructure code. There are different types of modules, each serving a specific purpose in structuring and managing Terraform code. Below are the key types of modules in Terraform:


Types of Modules in Terraform
In Terraform, modules are used to organize and reuse infrastructure code. There are different types of modules, each serving a specific purpose in structuring and managing Terraform code. Below are the key types of modules in Terraform:

## 1. Root Module
The root module is the directory that contains the .tf files where you run Terraform commands like terraform init, terraform plan, and terraform apply. It can directly manage resources or call child modules.

### Example:
```bash
$ tree
.
├── main.tf
├── outputs.tf
└── variables.tf
```

## 2. Child Modules
A child module is any module that is called or referenced by another module (usually the root module or another child module). These modules are often stored in separate directories or remote sources and can be reused across different environments.

### Example:
```hcl
# main.tf in root module
module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
}

module "web" {
  source = "./modules/web-server"

  instance_type = "t2.micro"
}
```
Here, the root module is calling two child modules:
- One for the VPC configuration (./modules/vpc).
- One for the web server configuration (./modules/web-server).
## 3. Published Modules
Published modules are modules that are publicly available on the Terraform Registry or other version control systems like GitHub. These modules are reusable, community-shared, or private modules that can be easily integrated into other Terraform configurations.
### Example:
```hcl
# Using a module from the Terraform Registry
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name           = "example-instance"
  instance_count = 1
}
```
In this example, the terraform-aws-modules/ec2-instance/aws module is being used from the Terraform Registry to create an EC2 instance.

## 4. Remote Modules
Remote modules are child modules stored remotely, such as in a Git repository, object storage, or a module registry. They can be called by specifying the source as the remote location.
### Example:
```hcl
module "network" {
  source = "git::https://github.com/user/terraform-modules.git//vpc?ref=v1.0.0"
  
  cidr_block = "10.0.0.0/16"
}
```
In this example, the module is sourced from a remote Git repository, with version v1.0.0.