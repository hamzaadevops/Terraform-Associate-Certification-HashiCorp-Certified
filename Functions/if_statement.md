## If Statement
- Consider we want to create a random password.
- The length of password depends on any much the user needs.
- But the minimum length must be 8.
- Lets do this using terraform random provider

### Syntax: 
```bash
condition ? true_value : false_value
```

### Example:
```hcl
variable "length" {
    type = number
    description = "length of password to be generated"
}
resource "random_provider" "generate_paaswd" {
    # this conditions uses the length as var.length 
    # if the var.length is greater than 8 
    # otherwise length is 8.
    length = var.length > 8 ? var.length : 8

    # Optional: additional settings for the generated password
    special  = true   # Include special characters
    upper    = true   # Include uppercase letters
    lower    = true   # Include lowercase letters
    numeric  = true   # Include numbers
}
# Output the generated password
output "generated_password" {
  value = random_password.generate_password.result
}
```