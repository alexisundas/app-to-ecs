# Check if the ECR repository already exists
data "aws_ecr_repository" "existing_repo" {
  name = "counting-app"
}

# Conditional resource creation using the count feature
resource "aws_ecr_repository" "counting_app" {
  count = length(data.aws_ecr_repository.existing_repo.repositories) == 0 ? 1 : 0

  name = "counting-app"
}
