# Most Important Built-in Terraform Functions

Terraform provides a variety of built-in functions to help manage resources dynamically. These functions are categorized into different types, such as string manipulation, numeric functions, collections, and more.

## 1. `lookup`

The `lookup` function retrieves a value from a map, providing a default value if the key doesn't exist.

### Syntax:

```hcl
lookup(map, key, default)
```
### Example:
```hcl
variable "instance_types" {
  default = {
    "dev"     = "t2.micro",
    "staging" = "t3.medium",
    "prod"    = "t3.large"
  }
}

output "instance_type" {
  value = lookup(var.instance_types, "dev", "t2.micro")
}
```

## 2. `cidrsubnet`
The `cidrsubnet` function calculates subnet addresses within a given CIDR block.

### Example:
```hcl
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

output "subnet_cidr" {
  value = cidrsubnet(var.vpc_cidr, 8, 1)
}
```

## Summary
These are some of the most important and frequently used Terraform functions:

- **lookup:** Retrieve values from maps with a fallback option.
- **length:** Get the size of a list, map, or string.
- **join / split:** Combine or split strings.
- **element:** Retrieve an element from a list based on its index.
- **file:** Read the contents of a file.
- **concat / flatten:** Merge or flatten lists.
- **cidrsubnet:** Calculate subnet addresses from a CIDR block.
- **terraform.workspace:** Retrieve the current Terraform workspace.
- **coalesce:** Return the first non-null value.
- **toset:** Convert a list to a set.