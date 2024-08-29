
# Configuração do Load Balancer
resource "aws_lb" "external-loadbalancer" {
  name               = "external-loadbalancer"
  internal           = false  # Defina como true se desejar um Load Balancer interno
  enable_deletion_protection = true
  idle_timeout           = 4000
  load_balancer_type = "application"
  security_groups    = [aws_security_group.external-loadbalancer_security_group.id]
  subnets            = aws_subnet.public_subnet.*.id  # Substitua pela lista de subnets desejadas
}


# Configuração do Listener HTTPS do Load Balancer
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.external-loadbalancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_application_app.arn
  }
  

  certificate_arn = aws_acm_certificate.ssl_certificate.arn
}

# Criação de regra de encaminhamento para encaminhar para um grupo de destino com base no cabeçalho do host HTTP
resource "aws_lb_listener_rule" "kafka-ui" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 2

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_kafka_ui.arn
  }

  condition {
    host_header {
      values = ["kafka-ui.application.com.br"]
    }
  }
}



resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.external-loadbalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "redirect"
    redirect {
      protocol         = "HTTPS"
      port             = "443"
      status_code      = "HTTP_301"
    }
  }
}

resource "aws_lb_listener_rule" "swarmpit-ui" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 3

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_swarmpit_ui.arn
  }

  condition {
    host_header {
      values = ["swarmpit.application.com.br"]
    }
  }
}

resource "aws_lb_listener_rule" "application-app" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_application_app.arn
  }

  condition {
    host_header {
      values = ["crm.application.com.br"]
    }
  }
}


resource "aws_lb_listener_rule" "application-middleware" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 4

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_application_middleware.arn
  }

  condition {
    host_header {
      values = ["middleware.application.com.br"]
    }
  }
}

