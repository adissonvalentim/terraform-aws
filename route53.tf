# PRIVATE
resource "aws_route53_zone" "private" {
  name = var.route53["private_zone_name"]
  vpc {
    vpc_id = aws_vpc.production.id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_record" "kafka" {
  count   = 1
  zone_id = aws_route53_zone.private.zone_id
  name    = "kafka"
  type    = "A"
  ttl     = 300
  records = aws_instance.infra_instance.*.private_ip
}

resource "aws_route53_record" "mongo" {
  count   = 1
  zone_id = aws_route53_zone.private.zone_id
  name    = "mongo"
  type    = "A"
  ttl     = 300
  records = aws_instance.infra_instance.*.private_ip
}

# # PUBLIC
resource "aws_route53_zone" "public" {
  name = var.route53["public_zone_name"]
}

resource "aws_route53_record" "kafka-ui" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "kafka-ui"
  type    = "A"
  alias {
    name                   = aws_lb.external-loadbalancer.dns_name
    zone_id                = aws_lb.external-loadbalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "swarmpit" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "swarmpit"
  type    = "A"
  alias {
    name                   = aws_lb.external-loadbalancer.dns_name
    zone_id                = aws_lb.external-loadbalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "application-app" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "crm"
  type    = "A"
  alias {
    name                   = aws_lb.external-loadbalancer.dns_name
    zone_id                = aws_lb.external-loadbalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "application-middleware" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "middleware"
  type    = "A"
  alias {
    name                   = aws_lb.external-loadbalancer.dns_name
    zone_id                = aws_lb.external-loadbalancer.zone_id
    evaluate_target_health = true
  }
}
