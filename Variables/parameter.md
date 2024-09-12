# Key Parameters in Variable Definitions
## type: 
Specifies the data type for the variable. Terraform supports multiple types such as string, number, bool, list, map, set, object, tuple, etc.

Example:

``` hcl
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
```

## default:
Sets a default value for the variable. If no value is provided during execution (like in a terraform.tfvars file or command line), Terraform will use the default.

Example:

```hcl
variable "instance_count" {
  type    = number
  default = 1
}
```
If no default is provided and no value is supplied, Terraform will prompt the user for input during terraform apply.

## nullable:

Determines whether the variable can accept a null value. By default, all variables are nullable. Setting nullable = false will force the user to provide a non-null value.

Example:
```hcl
variable "database_name" {
  type     = string
  nullable = false
}
```
### default vs nullable:

You can combine the default and nullable parameters to control whether a value must be provided. If a variable has a default value and is nullable, Terraform can use the default or a null value. If you set nullable = false but provide no default, the user must supply a value.

## validation:
The validation block allows you to define custom validation rules for the variable to ensure that the input matches certain criteria. If the validation rule fails, Terraform will return an error and prevent the execution.
You define validation rules using the condition and error_message parameters.
### Example: Validating the instance type to ensure it’s within a specific set of values:

```hcl
variable "instance_type" {
  type = string

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "The instance type must be either t2.micro, t2.small, or t2.medium."
  }
}

resource "local_file" "foo" {
  content  = var.content
  filename = “/random/foo.txt”
}

variable "content" {
  type        = string
  description = "Content of the file to be created"

  validation {
    condition     = substr(var.content, 0, 4) == "foo-"
    error_message = "The content value must be a valid word starting \"foo-\"."
  }
}

```
In this case, the condition checks if the value of instance_type is one of the allowed types. If not, the specified error_message will be shown.

### Example: 
Validation for a number type:

```hcl
variable "instance_count" {
  type = number

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "The instance count must be between 1 and 10."
  }
}
```
This ensures the variable instance_count stays within the allowed range.

## sensitive:

Marks the variable as sensitive, which means Terraform will hide the value in the CLI output. This is typically used for secrets, such as passwords or API keys.

### Example:

```hcl
variable "db_password" {
  type      = string
  sensitive = true
}
```
By marking a variable as sensitive, its value will not be logged or displayed, making it secure.