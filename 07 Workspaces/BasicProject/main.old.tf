# Create an AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with a valid AMI ID
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}