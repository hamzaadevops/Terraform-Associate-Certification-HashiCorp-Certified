## Combining Dynamic Blocks and Splat Expressions
You can use both dynamic blocks and splat expressions in the same configuration. For instance, using dynamic blocks to create multiple resources and then splat expressions to extract certain attributes from those resources.

### Example:
```hcl
resource "aws_security_group_rule" "example" {
  count = length(var.allowed_ports)

  type              = "ingress"
  from_port         = var.allowed_ports[count.index].from_port
  to_port           = var.allowed_ports[count.index].to_port
  protocol          = var.allowed_ports[count.index].protocol
  cidr_blocks       = [var.allowed_ports[count.index].cidr]
}

output "rule_ids" {
  value = aws_security_group_rule.example[*].id
}
```
### Explanation:
- **Dynamic-like behavior with count:** The count argument allows you to repeat the security group rule for each element in var.allowed_ports.
- **Splat expression:** The splat expression in the output block retrieves the id attribute for each aws_security_group_rule resource.