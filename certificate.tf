# Importa o certificado SSL para o AWS ACM
resource "aws_acm_certificate" "ssl_certificate" {
  
  certificate_body = file("${path.module}/certificados/cert.pem")
  private_key      = file("${path.module}/certificados/privkey.pem")
}

# data "aws_acm_certificate" "ssl_certificate_info" {
#   domain = "*.mantarine.com.br"
# }

# resource "aws_route53_record" "route53_record_certificate" {
#   allow_overwrite = true
#   count           = length(data.aws_acm_certificate.ssl_certificate_info.domain_validation_options)

#   name    = data.aws_acm_certificate.ssl_certificate_info.domain_validation_options[count.index].resource_record_name
#   records = [data.aws_acm_certificate.ssl_certificate_info.domain_validation_options[count.index].resource_record_value]
#   ttl     = 60
#   type    = data.aws_acm_certificate.ssl_certificate_info.domain_validation_options[count.index].resource_record_type
#   zone_id = aws_route53_zone.public.zone_id
# }