# Basic Terraform Commands

## 1. What is `terraform fmt`?

The `terraform fmt` command is used to **automatically format** your Terraform configuration files according to the recommended style guidelines. It helps ensure that all your `.tf` and `.tfvars` files are consistently formatted, which improves readability and reduces syntax issues caused by improper formatting.

Terraform will:
- Align equal signs (`=`) for key-value pairs.
- Format indentation and spacing.
- Add missing or correct misplaced whitespace in the configuration.

This command does not change the functionality of your Terraform code, only its layout.

---

### Usage

```bash
terraform fmt [options] [DIR]
```
- DIR: Optional. Specifies the directory to run the command in. If omitted, terraform fmt will run in the current working directory.
- terraform fmt: Formats all .tf and .tfvars files in the current directory.
- terraform fmt -recursive: Formats files in the current directory and all subdirectories.
- terraform fmt -check: Checks if files are already formatted, without making changes.
- terraform fmt -diff: Displays differences between the current format and the expected format.
- terraform fmt -list=false: Suppresses the list of formatted files.

## 2. terraform plan
The terraform plan command is used to create an execution plan, showing what Terraform will do when you apply the configuration. It compares the current state of your infrastructure with the desired state in the configuration files and outputs the changes that will be made (if any).

```bash
terraform plan
```
### Common Flags:
- out=plan.out: Saves the generated plan to a file for later execution with terraform apply.
- var 'key=value': Passes variable values directly via the command line.
## 3. terraform apply
The terraform apply command is used to apply the changes required to reach the desired state of the configuration. It executes the actions defined in the plan to update, create, or destroy resources.

```bash
terraform apply
```
### Common Flags:
- auto-approve: Automatically applies changes without waiting for user confirmation.
- var 'key=value': Passes variable values directly via the command line.
terraform apply plan.out: Applies the changes from a saved plan file.
## 4. terraform validate
The terraform validate command checks whether the configuration files are syntactically valid. It ensures that your configuration is well-formed and valid according to Terraform's requirements but doesn't check for resource existence or runtime issues.

```bash
terraform validate
```
## 5. terraform show
The terraform show command displays the current state or a Terraform plan. You can use this to inspect the current state of your infrastructure or see what changes are outlined in a plan file.

```bash
terraform show
```
Usage:
- terraform show: Displays the current state.
- terraform show plan.out: Displays the details of a previously generated execution plan.
## 6. terraform refresh
The terraform refresh command updates the Terraform state to reflect the real-world state of the infrastructure. It queries the providers to check the current state of the infrastructure and updates the state file without modifying any infrastructure.

```bash
terraform refresh
```
## 7. terraform destroy
The terraform destroy command is used to remove all infrastructure resources defined in your Terraform configuration. This is useful for cleaning up resources when no longer needed.

```bash
terraform destroy
```
### Common Flags:
- auto-approve: Automatically destroys resources without waiting for user confirmation.
## 8. terraform output
The terraform output command is used to display the values of output variables defined in your configuration. This can be useful to retrieve information about your infrastructure, such as resource IDs or public IP addresses, without manually querying resources.

```bash
terraform output
```
### Usage:
- terraform output <output_name>: Displays the value of a specific output variable.
- terraform output -json: Displays the outputs in JSON format, useful for automation.
## 9. terraform state
The terraform state command is used to interact with the Terraform state file. You can list resources, show details, move resources between state files, or remove resources from the state.

```bash
terraform state list
```
### Common Subcommands:
- terraform state list: Lists all resources in the current state.
- terraform state show <resource>: Shows detailed information for a resource in the state.
- terraform state mv: Moves resources from one state to another.
- terraform state rm <resource>: Removes a resource from the state.

## 10. terraform graph
The terraform graph command generates a visual representation of the Terraform dependency graph. This can help you understand the relationships between resources in your configuration.

```bash
terraform graph
```
### Usage: 
You can pipe the output to a tool like Graphviz to visualize the dependencies.

```bash
terraform graph | dot -Tpng > graph.png
```
## 11. terraform import
The terraform import command is used to import existing infrastructure into your Terraform state. This allows you to manage resources that were created manually or by other means.

```bash
terraform import <resource_type>.<resource_name> <resource_id>
```
### Example:

```bash
terraform import aws_instance.my_instance i-1234567890abcdef
```
## 12. terraform taint
The terraform taint command marks a resource as needing to be destroyed and recreated on the next terraform apply. This is useful for forcing changes to a resource when Terraform does not detect a change automatically.

```bash
terraform taint <resource_name>
```
## 13. terraform untaint
The terraform untaint command reverses the effect of terraform taint, removing the "tainted" state from the resource so it will not be destroyed and recreated on the next terraform apply.

```bash
terraform untaint <resource_name>
```
## 14. terraform workspace
The terraform workspace command is used to manage multiple workspaces, which allow you to have multiple states for the same configuration (e.g., for different environments like development and production).

```bash
terraform workspace list
```
### Common Subcommands:
- terraform workspace new <workspace_name>: Creates a new workspace.
- terraform workspace select <workspace_name>: Switches to an existing workspace.
- terraform workspace delete <workspace_name>: Deletes an existing workspace.
## Summary of Common Commands:
- terraform init: Initializes the working directory.
- terraform plan: Previews the actions Terraform will take.
- terraform apply: Applies the changes to the infrastructure.
- terraform validate: Validates the configuration syntax.
- terraform show: Displays the state or plan details.
- terraform refresh: Updates the state to match real-world infrastructure.
- terraform destroy: Destroys all managed infrastructure resources.
- terraform output: Displays output variable values.
- terraform graph: Visualizes the dependency graph.
