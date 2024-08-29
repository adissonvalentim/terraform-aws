# Recursos para o grupo de segurança da instância de backend
resource "aws_security_group" "backend_security_group" {
  name        = var.backend_security_group["name"]
  description = var.backend_security_group["description"]
  vpc_id      = aws_vpc.production.id

  ingress {
    description = "Allow traffic to backend"
    from_port   = var.ports_backend[0]
    to_port     = var.ports_backend[0]
    protocol    = local.protocol_tcp
    cidr_blocks = [var.network_config["vpc_cidr_block"]]
  }

  ingress {
    description     = "Allow all traffic from ELB security group"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.external-loadbalancer_security_group.id]
  }
  
  ingress {
    description = "Allow traffic to backend"
    from_port   = 22
    to_port     = 22
    protocol    = local.protocol_tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Recursos para o grupo de segurança da instância de frontend
resource "aws_security_group" "frontend_security_group" {
  name        = var.frontend_security_group["name"]
  description = var.frontend_security_group["description"]
  vpc_id      = aws_vpc.production.id

  ingress {
    description      = "Allow traffic to frontend"
    from_port        = var.ports_frontend[0]
    to_port          = var.ports_frontend[0]
    protocol         = local.protocol_tcp
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description     = "Allow all traffic from ELB security group"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.external-loadbalancer_security_group.id]
  }

  ingress {
    description = "Allow traffic to backend"
    from_port   = 22
    to_port     = 22
    protocol    = local.protocol_tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Recursos para o grupo de segurança da instância de infra
resource "aws_security_group" "infra_security_group" {
  name        = var.infra_security_group["name"]
  description = var.infra_security_group["description"]
  vpc_id      = aws_vpc.production.id 

  ingress {
    description = "Allow traffic to infra"
    from_port   = var.ports_infra[0]
    to_port     = var.ports_infra[0]
    protocol    = local.protocol_tcp
    cidr_blocks = [var.network_config["vpc_cidr_block"]]
  }

  ingress {
    description = "Allow traffic to infra"
    from_port   = var.ports_infra[2]
    to_port     = var.ports_infra[2]
    protocol    = local.protocol_tcp
    cidr_blocks = [var.network_config["vpc_cidr_block"]]
  }

   ingress {
    description = "Allow traffic to infra"
    from_port   = var.ports_infra[3]
    to_port     = var.ports_infra[3]
    protocol    = local.protocol_tcp
    cidr_blocks = [var.network_config["vpc_cidr_block"]]
  }

  ingress {
    description     = "Allow all traffic from ELB security group"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.external-loadbalancer_security_group.id]
  }
  
  ingress {
    description = "Allow traffic to backend"
    from_port   = 22
    to_port     = 22
    protocol    = local.protocol_tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Recursos para o grupo de segurança da instância de external-loadbalancer
resource "aws_security_group" "external-loadbalancer_security_group" {
  name        = var.external-loadbalancer_security_group["name"]
  description = var.external-loadbalancer_security_group["description"]
  vpc_id      = aws_vpc.production.id 

  ingress {
    description = "Allow traffic to external-loadbalancer"
    from_port   = var.ports_external-loadbalancer[0]
    to_port     = var.ports_external-loadbalancer[0]
    protocol    = local.protocol_tcp
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "Allow traffic to external-loadbalancer"
    from_port   = var.ports_external-loadbalancer[1]
    to_port     = var.ports_external-loadbalancer[1]
    protocol    = local.protocol_tcp
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
