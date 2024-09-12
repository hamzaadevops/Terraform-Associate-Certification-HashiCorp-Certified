# Terraform Workspaces

## What are Terraform Workspaces?

Terraform workspaces provide a way to manage multiple environments (e.g., development, staging, production) within a single Terraform configuration. Each workspace has its own state file, allowing you to maintain isolated environments for the same configuration.

## Key Concepts

- **Default Workspace**: The initial workspace created automatically when you initialize Terraform. It is named `default`.
- **Additional Workspaces**: Additional workspaces can be created for different environments or use cases.

## Commands

### 1. `terraform workspace list`

Lists all available workspaces.

```bash
terraform workspace list
```

### 2. terraform workspace new
Creates a new workspace with the specified name.

```bash
terraform workspace new <workspace_name>
terraform workspace new staging
```
### 3. terraform workspace select <workspace_name>
Switches to the specified workspace. Changes to the Terraform configuration will apply to the selected workspace.

```bash
terraform workspace select <workspace_name>
terraform workspace select staging
```
### 4. terraform workspace show
Displays the name of the current workspace.
```bash
terraform workspace show
```

### 5. terraform workspace delete <workspace_name>
Deletes the specified workspace. You cannot delete the currently selected workspace; you must switch to another workspace first.

```bash
terraform workspace delete <workspace_name>
terraform workspace delete staging
```