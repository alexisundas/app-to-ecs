resource "aws_ecr_repository" "counting_app" {
    name = var.ecr_repo_name
}