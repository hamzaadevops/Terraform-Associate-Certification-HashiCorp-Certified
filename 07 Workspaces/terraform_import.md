# Terraform Import

## What is `terraform import`?

The `terraform import` command allows you to **import existing infrastructure** into your Terraform state file. This command is useful when you have resources that were created outside of Terraform or if you want to bring existing resources under Terraform management. Importing a resource enables Terraform to manage and update it using your configuration files.

## Usage

```bash
terraform import [options] <address> <id>
```
- <address>: The address of the resource in the Terraform configuration (e.g., aws_instance.my_instance).
- <id>: The ID of the existing resource in the provider’s infrastructure.
## Example
Suppose you have an existing AWS EC2 instance with the ID i-1234567890abcdef0, and you want to import it into your Terraform configuration.

### Add the Resource to Your Configuration
Add a resource block in your Terraform configuration file:

```hcl
resource "aws_instance" "my_instance" {
  # Configuration here
}
```
### Run the Import Command
Use the terraform import command to import the existing EC2 instance:

```bash
terraform import aws_instance.my_instance i-1234567890abcdef0
```
This command will import the EC2 instance into the state file and associate it with the resource aws_instance.my_instance.

