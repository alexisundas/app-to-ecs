terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "alexis-tf-state"
    key = "./terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "alexis-ddb"
    encrypt = true
  }
}

module "alexis_tf_state" {
  source = "./modules/tf-state"
  bucket_name = local.bucket_name
  table_name = local.table_name
}

module "ecr_repo" {
  source = "./modules/ecr"
  ecr_repo_name = local.ecr_repo_name
}

