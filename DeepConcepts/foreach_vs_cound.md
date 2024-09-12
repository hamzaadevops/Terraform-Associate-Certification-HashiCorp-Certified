## Differences
### 1. Input Type:
- **count:** Uses a numerical value to determine the number of resource instances.
- **for_each:** Uses a set or map to define multiple resource instances with potentially different configurations.
### 2. Configuration Flexibility:
- **count:** Less flexible; all resources created with count are identical, though their attributes can differ based on count.index.
- **for_each:** More flexible; allows different configurations for each resource based on the keys and values of the set or map.
### 3. Accessing Instances:
- **count:** Accessed using count.index, which provides the index of the resource instance.
- **for_each:** Accessed using each.key and each.value, which provide the key and value of the current element in the set or map.
## Example Comparison
### Using count:

```hcl
resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance-${count.index}"
  }
}
```
### Using for_each:

```hcl
resource "aws_instance" "example" {
  for_each = {
    "dev"    = "t2.micro",
    "staging" = "t3.medium",
    "prod"   = "t3.large"
  }

  ami           = "ami-12345678"
  instance_type = each.value

  tags = {
    Name = "example-instance-${each.key}"
  }
}
```
### Summary
- **count:** Use for creating a fixed number of identical resources or a dynamic number based on a numerical expression.
- **for_each:** Use for creating resources with varying configurations based on a set or map.

#### Use Count when:
- You need to create a fixed number of similar resources.
- Resource differences can be represented by an index.
#### Use For_each when:
- You're dealing with a collection of items that have unique identifiers.
- Your resources are not perfectly identical and require individual configurations.
- You plan to make future modifications that should not affect all resources.