resource "aws_ecr_repository" "counting_app" {
  name = "counting-app"

  lifecycle {
    ignore_changes = [name]
  }
}
