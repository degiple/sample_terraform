resource "aws_s3_bucket" "artifact" {
  bucket = "take-tf-cicdecr-artifacts"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

resource "aws_s3_bucket" "build-cache" {
  bucket = "take-tf-cicdecr-build-cache"
}