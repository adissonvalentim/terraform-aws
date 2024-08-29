locals {
  common_tags = {
    Environment = "Producao"
    ManagedBy   = "Terraform"
    AWS_version = "3.50.0"
    TF_version  = "1.5.3"
  }
  description_all    = "Allow all access"
  description_http   = "Allow HTTP access"
  description_https  = "Allow HTTPS access"
  description_ssh    = "Allow SSH access"
  port_http          = "80"
  port_mongo         = "27017"
  port_https         = "443"
  protocol_http      = "HTTP"
  protocol_https     = "HTTPS"
  protocol_tcp       = "TCP"
  protocol_udp       = "UDP"
}
