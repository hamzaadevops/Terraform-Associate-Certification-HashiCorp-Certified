# Terraform Taint and Logging

## Terraform Taint

### What is `terraform taint`?

The `terraform taint` command marks a specific resource as **tainted**, forcing it to be **destroyed and recreated** on the next `terraform apply`. This is useful when a resource is malfunctioning but its configuration hasn't changed, or if you want to ensure a fresh instance of the resource.

### Usage:

```bash
terraform taint <resource_name>
# Example
terraform taint aws_instance.my_instance
```
## Terraform Logging\
Terraform logging provides insight into the operations being performed by Terraform. It is useful for debugging and understanding what Terraform is doing behind the scenes. Logging can be controlled via environment variables and can provide detailed output about API requests, state changes, and more.
### Key Environment Variables:
- TF_LOG: Sets the logging level for Terraform. The levels include TRACE, DEBUG, INFO, WARN, and ERROR.

```bash
export TF_LOG=DEBUG
```

- TF_LOG_PATH: Specifies a file path to write the logs to, instead of displaying them on the console.

```bash
export TF_LOG_PATH=terraform.log
```
