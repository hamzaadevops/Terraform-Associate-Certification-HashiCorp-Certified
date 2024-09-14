## Terraform For-each
### What is for_each?
The for_each parameter allows you to create multiple instances of a resource based on a set or map. It provides greater flexibility by allowing you to define different configurations for each instance based on the elements of the set or map.

### Syntax:
```hcl
resource "aws_instance" "example" {
  for_each = {
    "dev"    = "t2.micro",
    "staging" = "t3.medium",
    "prod"   = "t3.large"
  }

  ami           = "ami-12345678"  # Replace with a valid AMI ID
  instance_type = each.value

  tags = {
    Name = "example-instance-${each.key}"
  }
}
```
###Key Points:
- **Usage:** Creates resources based on a set or map, allowing for different configurations.
- **Accessing Instances:** Use each.key to access the key of the current element, and each.value to access the value.
- **Flexibility:** More flexible when different configurations are needed for each resource.