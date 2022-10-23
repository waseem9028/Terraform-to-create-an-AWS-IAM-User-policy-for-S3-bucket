# provider "aws" {
#     region = var.region
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
module "S3" {
  source = "./S3"

}