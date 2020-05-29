resource "aws_ecr_repository" "repo" {
  name                 = "${var.resource_prefix}-k8s-demo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}