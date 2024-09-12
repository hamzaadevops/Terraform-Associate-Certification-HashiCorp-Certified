# Terraform Variables and Provider Block

## Variables in Terraform

In Terraform, variables allow you to parameterize your configurations, making them more flexible and reusable. Variables can be defined in a separate file and referenced in the main configuration.

### Defining Variables
Variables are typically defined in a `variables.tf` file using the `variable` block. For example:

```hcl
variable "instance_type" {
  description = "The type of instance to run"
  type        = string
  default     = "t2.micro"
}
```

You can reference this variable in the configuration using the syntax var.<var_name>, like so:
``` hcl
resource "aws_instance" "example" {
  instance_type = var.instance_type
}
```

## Providing Values to Variables
Interactive Mode: When running terraform apply, if a variable is not provided a value, Terraform will prompt you to input the value interactively.

### Using Environment Variables: 
You can set a variable using environment variables with the syntax TF_VAR_<var_name>. For example:

```bash
export TF_VAR_instance_type="t2.large"
```
This environment variable will take precedence over other variable sources (discussed in the precedence section below).

### Using Variable Files: 
You can define variables in a file such as terraform.tfvars or *.auto.tfvars. These files are automatically loaded by Terraform.

### Auto-loaded variable files:
        
        terraform.tfvars

        terraform.tfvars.json
        
        *.auto.tfvars
        
        *.auto.tfvars.json
### Manually Specifying Variable Files: 
Other variable files (e.g., variables.tfvars) are not auto-loaded and must be specified explicitly when running terraform apply:

```bash
terraform apply --var-file="variables.tfvars"
```
Inline Variables: Variables can also be passed directly via the command line:

```bash
terraform apply -var="instance_type=t2.large"
```