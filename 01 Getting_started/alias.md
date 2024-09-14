# Using Alias in Terraform Provider

## Defining Multiple Providers with Alias

When working with multiple instances of the same provider, such as deploying resources across different regions, you can use the `alias` argument in the provider block.

For example, here is how to define AWS providers for two different regions:

```hcl
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}
```

## Using Multiple Providers with Alias
``` hcl
resource "aws_instance" "example_east" {
  provider      = aws.east
  instance_type = "t2.micro"
  ami           = "ami-123456"
}

resource "aws_instance" "example_west" {
  provider      = aws
  instance_type = "t2.micro"
  ami           = "ami-789012"
}
