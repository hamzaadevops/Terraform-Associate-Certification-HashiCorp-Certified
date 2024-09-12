# Terraform Data Sources

## What Are Data Sources?

In Terraform, **data sources** allow you to query and retrieve information that is defined outside of Terraform’s management. This information could come from existing infrastructure or services managed by your cloud provider or even from other Terraform configurations. You can use data sources to reference these existing resources and incorporate them into your infrastructure management.

Data sources do not create or modify infrastructure but provide useful information for configuring resources.

---

## Syntax of a Data Source

A typical data source block includes:
- **`data`**: The keyword to declare the data source.
- **`<PROVIDER>`**: The cloud provider or resource provider.
- **`<NAME>`**: The name you assign to the data source.
- **`<IDENTIFIER>`**: The name of the specific data source to be queried.

```hcl
data "<PROVIDER>_<IDENTIFIER>" "<NAME>" {
  # Configuration and filters for the data source
}
```
## Example: AWS AMI Data Source
```hcl
data "aws_ami" "example" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
```
In this example:

- The aws_ami data source retrieves information about an Amazon Machine Image (AMI).
- The filter blocks specify criteria such as the AMI name and virtualization type.
- The owners = ["amazon"] ensures that the AMI is from AWS.

## Example: Referencing Data Source Output
After retrieving data from a data source, you can reference it in your configuration:

```hcl
resource "aws_instance" "example" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"
}
```
Here, the AMI ID retrieved from the aws_ami data source is used to launch an EC2 instance.

## Common Use Cases for Data Sources
Using Existing Resources: You can reference existing infrastructure that isn’t managed by your current Terraform configuration (e.g., existing VPCs, subnets, security groups).

```hcl
data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "example" {
  vpc_id = data.aws_vpc.default.id
}
```
### Querying Cloud Provider Information: 
You can use data sources to retrieve information such as the latest AMI, available instance types, regions, etc.

```hcl
data "aws_region" "current" {}

output "region" {
  value = data.aws_region.current.name
}
```
### Managing Multiple Environments: 
You can use data sources to retrieve infrastructure details across different environments (e.g., production and development environments).

## Key Parameters in Data Sources
### filter: 
A way to filter the resources returned by the data source query based on specific criteria.

```hcl
filter {
  name   = "tag:Environment"
  values = ["production"]
}
```
### depends_on: 
Specifies dependencies for the data source query, useful when ensuring other resources are created or configured before the data source query runs.

```hcl
data "aws_ami" "example" {
  most_recent = true
  depends_on  = [aws_instance.example]
}
```
### lifecycle: this parameter does not exists for datasource