## Terraform Count

### What is `count`?

The `count` parameter allows you to create multiple instances of a resource based on a numerical value. It is useful when you want to create a fixed number of resources or when the number of resources is dynamic but determined by an expression that evaluates to a number.

### Syntax:

```hcl
resource "aws_instance" "webserver" {
  count         = 3
  ami           = "ami-12345678"  
  name     = "webserver-${count.index}"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance-${count.index}"
  }
}
```
### Key Points:
- **Usage:** Creates a specified number of identical resources.
- **Accessing Instances:** Use count.index to reference the index of each resource instance (e.g., ${count.index}).
- **Limitations:** Less flexible when creating resources with different configurations.