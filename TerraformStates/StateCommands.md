# Terraform State Subcommands

## 1. `terraform state list`

The `terraform state list` command lists all the resources currently tracked in the Terraform state. This is useful for inspecting the resources managed by Terraform.

### Usage:

```bash
terraform state list
```

### Example:
```bash
Copy code
terraform state list
# Outputs:
aws_instance.my_instance
aws_s3_bucket.my_bucket
```

This command will show a list of all resources Terraform is managing in the current state file.

## 2. terraform state show
The terraform state show command displays detailed information about a specific resource in the state file. It provides information such as resource properties, metadata, and dependencies.

### Usage:
```bash
Copy code
terraform state show <resource_name>
```
### Example:
```bash
Copy code
terraform state show aws_instance.my_instance
```
This command will display detailed information about the aws_instance.my_instance resource, such as its ID, attributes, and dependencies.

## 3. terraform state mv
The terraform state mv command moves resources from one state to another, either within the same state file or between different state files. This is useful when refactoring configurations and renaming resources.

### Usage:
```bash
Copy code
terraform state mv <source> <destination>
```
### Example:
```bash
Copy code
terraform state mv aws_instance.my_instance aws_instance.new_instance
```
This command will move the resource aws_instance.my_instance to aws_instance.new_instance in the state file.

## 4. terraform state pull
The terraform state pull command downloads the latest state from a remote backend and outputs it in the terminal. It’s helpful when you want to manually inspect the state without modifying anything.

### Usage:
```bash
Copy code
terraform state pull
```
This command will output the entire state file in JSON format.

## 5. terraform state push
The terraform state push command uploads a local state file to a remote backend. This is useful for manually syncing state when needed. Typically, this command is used when the local state needs to be synchronized with the remote state.

### Usage:
```bash
Copy code
terraform state push <local_state_file>
```
### Example:
```bash
Copy code
terraform state push terraform.tfstate
```
This command will upload the terraform.tfstate file to the configured remote backend.

## 6. terraform state rm
The terraform state rm command removes one or more resources from the Terraform state file. This is useful when a resource has been destroyed manually and you no longer want Terraform to manage it.

### Usage:
```bash
Copy code
terraform state rm <resource_name>
```
### Example:
```bash
Copy code
terraform state rm aws_instance.my_instance
```
This command will remove the aws_instance.my_instance resource from the Terraform state file. Terraform will no longer track this resource.

## 7. terraform state replace-provider
The terraform state replace-provider command is used to replace all instances of one provider with another in the state file. This can be useful when upgrading or changing providers.

### Usage:
```bash
Copy code
terraform state replace-provider <old_provider> <new_provider>
```
### Example:
```bash
Copy code
terraform state replace-provider registry.terraform.io/hashicorp/aws registry.terraform.io/examplecorp/aws
```
This command will replace the provider from hashicorp/aws to examplecorp/aws in the state file.

Summary of terraform state Subcommands:
- terraform state list: Lists all resources in the current state.
- terraform state show <resource>: Shows detailed information for a resource in the state.
- terraform state mv <source> <destination>: Moves a resource within or between state files.
- terraform state pull: Downloads the latest remote state to your local terminal.
- terraform state push <local_state_file>: Uploads a local state file to a remote backend.
- terraform state rm <resource>: Removes a resource from the state.
- terraform state replace-provider <old_provider> <new_provider>: Replaces one provider with another in the state.
