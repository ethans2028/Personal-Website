# acts as our dns server to serve the content
resource "aws_route53_zone" "main_hosted_zone" {
  name = var.domain
}

# create route53 record to automatically validate the SSL certificate we created with aws certificate manager
resource "aws_route53_record" "domain_verification_record" {
    for_each = {
      for dvo in aws_acm_certificate.domain_cert.domain.validation_options : dvo.domain_name => {
        name = dvo.resource_record_name
        record = dvo.resource_record_value
        type = dvo.resource_record_type
      }
    }

    zone_id = aws_route53_zone.main_hosted_zone.zone_id
    name = each.value.name
    type = each.value.type

    records = [each.value.record]
    # time to load
    ttl = 60
    allow_overwrite = true

}

# host content from cloudfront in the form of an A record
resource "aws_route53_record" "protfolio_dns_record" {
  zone_id = aws_route53_zone.main_hosted_zone.id
  name = var.domain
  type = "A"

  alias {
    name = 
    zone_id =
    evaluate_target_health = false
  }
  
}