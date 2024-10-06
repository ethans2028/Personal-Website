resource "aws_cloudfront_distribution" "portfolio_cloudfront_distribution" {
  enabled = true
  is_ipv6_enabled = true
  default_root_object = var.default_document
  wait_for_deployment = true


  origin {
    domain_name = aws_s3_bucket_website_configuration.portfolio_bucket_config.website_endpoint
    origin_id = var.bucket_name

  }

  
}