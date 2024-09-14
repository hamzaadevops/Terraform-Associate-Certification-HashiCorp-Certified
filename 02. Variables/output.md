# Terraform Output Variables

## 1. Output Definition

In Terraform, **output variables** allow you to extract information from your infrastructure configuration and display it after resources are created. These outputs are helpful for debugging, passing information between modules, or exposing data to users and scripts.

### Basic Syntax

```hcl
output "output_name" {
  value = <expression>
}
```

### Example
```hcl
output "instance_id" {
  value = aws_instance.my_instance.id
}
```
In this example, the output instance_id will display the ID of the EC2 instance named my_instance.

## 2. Sensitive Parameter:
The sensitive parameter is used to hide sensitive data in Terraform outputs. If marked as sensitive, the value will not appear in Terraform's console output, helping to protect sensitive information such as passwords or API keys.

### Syntax
```hcl
output "output_name" {
  value     = <expression>
  sensitive = true
}
```
### Example
```hcl
output "db_password" {
  value     = aws_rds_instance.mydb.password
  sensitive = true
  description = "The RDS database password"
}
```
sensitive = true: Ensures that the output is hidden in the CLI output, but the value is still available for automation or further processing.

we can view sensitive output using this
```bash
terraform output output_name
```

## 3. depends_on Parameter
The depends_on parameter in output variables allows you to specify dependencies for an output. By default, Terraform handles dependencies automatically, but in complex cases, you can explicitly declare a dependency to ensure that the resource is created before evaluating the output.

### Syntax
```hcl
output "output_name" {
  value      = <expression>
  depends_on = [<resource>]
}
```
### Example
```hcl
output "bucket_arn" {
  value       = aws_s3_bucket.my_bucket.arn
  depends_on  = [aws_s3_bucket.my_bucket]
  description = "The ARN of the S3 bucket"
}
```
depends_on = [aws_s3_bucket.my_bucket]: Ensures that the S3 bucket resource is created before the output is evaluated.
