# Terraform Provisioners

## What are Provisioners?

Provisioners in Terraform are used to **execute scripts or commands** on your resources after they have been created. They help with configuration tasks that cannot be accomplished using Terraform's native resource arguments or when additional configuration is needed.

## Types of Provisioners

### Local Provisioner

**Local Provisioner** executes scripts or commands on the machine where Terraform is running. This is useful for tasks that need to be done on the local machine or within the context of the Terraform execution environment.

#### Syntax:

```hcl
provisioner "local-exec" {
  command = "echo Hello, World!"
}
```
#### Example:
```hcl
resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo Instance ID: ${self.id} >> instance-ids.txt"
  }
}
```

### Remote Provisioner
Remote Provisioner executes scripts or commands on the target resource itself, typically over SSH or WinRM. This is useful for configuring the resource after it has been created, such as installing software or configuring services.

#### Syntax:
```hcl
provisioner "remote-exec" {
  inline = [
    "echo Hello, World!",
    "apt-get update"
  ]
}
```

#### Example:
```hcl 
resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}
```
