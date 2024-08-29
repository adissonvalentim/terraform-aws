# Configuração do Target Group
resource "aws_lb_target_group" "target_group_kafka_ui" {
  name     = "TG-Kafka-Ui"
  port     = 8080  # Porta do backend
  protocol = "HTTP"
  vpc_id   = aws_vpc.production.id  # Substitua pela ID da sua VPC

  health_check {
    path                = "/"
    port                = "8080"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Registro dos Targets Infra no Target Group
resource "aws_lb_target_group_attachment" "target_group_attachment" {
  count            = length(aws_instance.infra_instance)
  target_group_arn = aws_lb_target_group.target_group_kafka_ui.arn
  target_id        = aws_instance.infra_instance[count.index].id  # Substitua pela ID da sua instância AWS
}


# Configuração do Target Group
resource "aws_lb_target_group" "target_group_swarmpit_ui" {
  name     = "TG-Swarmpit-Ui"
  port     = 6666  # Porta do backend
  protocol = "HTTP"
  vpc_id   = aws_vpc.production.id  # Substitua pela ID da sua VPC

  health_check {
    path                = "/"
    port                = "6666"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "target_swarmpit_group_attachment" {
  count            = length(aws_instance.backend_instance)
  target_group_arn = aws_lb_target_group.target_group_swarmpit_ui.arn
  target_id        = aws_instance.backend_instance[count.index].id  # Substitua pela ID da sua instância AWS
}

# Configuração do Target Group
resource "aws_lb_target_group" "target_group_application_app" {
  name     = "TG-application-APP"
  port     = 8080  # Porta do backend
  protocol = "HTTP"
  vpc_id   = aws_vpc.production.id  # Substitua pela ID da sua VPC

  health_check {
    path                = "/"
    port                = "8080"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "target_application_app_group_attachment" {
  count            = length(aws_instance.frontend_instance)
  target_group_arn = aws_lb_target_group.target_group_application_app.arn
  target_id        = aws_instance.frontend_instance[count.index].id  # Substitua pela ID da sua instância AWS
}

# Configuração do Target Group
resource "aws_lb_target_group" "target_group_application_middleware" {
  name     = "TG-application-miDDLEWARE"
  port     = 3003  # Porta do backend
  protocol = "HTTP"
  vpc_id   = aws_vpc.production.id  # Substitua pela ID da sua VPC

  health_check {
    path                = "/health"
    port                = "3003"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "target_application_middleware_group_attachment" {
  count            = length(aws_instance.backend_instance)
  target_group_arn = aws_lb_target_group.target_group_application_middleware.arn
  target_id        = aws_instance.backend_instance[count.index].id  # Substitua pela ID da sua instância AWS
}