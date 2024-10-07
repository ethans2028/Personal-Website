# create certificate with certificate manager for our domain
resource "aws_acm_certificate" "domain_cert" {
  provider = aws.cert_region
  domain_name = var.domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}