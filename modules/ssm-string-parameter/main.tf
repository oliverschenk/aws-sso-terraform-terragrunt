resource "aws_ssm_parameter" "foo" {
  name  = var.name
  type  = "String"
  value = var.value
}
