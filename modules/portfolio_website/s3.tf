resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "portfolio_bucket_config" {
    bucket = aws_s3_bucket.portfolio_bucket.id

    index_document {
      suffix = var.default_document
    }

    error_document {
      key = var.error_document
    }

}

resource "aws_s3_bucket_public_access_block" "portfolio_bucket_access" {
    bucket = aws_s3_bucket.portfolio_bucket.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

# generates an IAM policy document in JSON.
data "aws_iam_policy_document" "portfolio_bucket_policy_document" {
  statement {
    principals {
      type = "*"
      identifiers = ["*"]
    }
    # this iam policy allows resources to get the s3_bucket object
    actions = ["s3:GetObject"]
    effect = "Allow"
    resources = [
        "${aws_s3_bucket.portfolio_bucket.arn}/*"
    ]
  }
}

# use the iam policy document data source and attach it to the s3
resource "aws_s3_bucket_policy" "portfolio_bucket_policy" {
    bucket = aws_s3_bucket.portfolio_bucket.id
    policy = data.aws_iam_policy_document.portfolio_bucket_policy_document.json
}