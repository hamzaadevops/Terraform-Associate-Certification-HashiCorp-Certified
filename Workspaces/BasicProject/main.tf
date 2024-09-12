# Determine the instance type based on the workspace
locals {
  instance_type = {
    "default" = "t2.micro",
    "dev"     = "t3.micro",
    "staging" = "t3.medium",
    "prod"    = "t3.large"
  }[terraform.workspace]
}

# Assign the instance type based on the workspace
resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with a valid AMI ID
  instance_type = local.instance_type

  tags = {
    Name = "example-instance"
  }
}
