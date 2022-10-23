resource "aws_s3_bucket" "khalids-bucket" {
  bucket = "khalids-bucket"
  acl    = "private"
}