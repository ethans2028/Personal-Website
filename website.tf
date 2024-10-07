module "website" {
  source = "./modules/portfolio_website"
  providers = {
    aws = aws
    aws.cert_region = aws.cert_region  # Pass the alias to the module
  }
  bucket_name            = "${var.company_name}-website-${var.stage}"
  domain                 = var.company_domain_name
}