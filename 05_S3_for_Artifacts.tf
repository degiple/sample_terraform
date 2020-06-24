resource "aws_s3_bucket" "artifact" {
  bucket = "take-tf-cicdecr-artifacts"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
