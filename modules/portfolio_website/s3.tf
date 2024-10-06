resource "aws_s3_bucket" "portfolio_website_bucket" {
  bucket = var.bucket_name
}

resource ""