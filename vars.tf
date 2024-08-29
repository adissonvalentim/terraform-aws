variable "aws_credentials" {
  description = "AWS Credentials"
  type        = object({
    access_key = string
    secret_key = string
    region     = string
  })
  default = {
    access_key = <Coloque a chave aqui>
    secret_key = <Coloque a chave aqui>
    region     = "us-east-1"
  }
}

variable "instance" {
  default = {
    "hostname_backend"    = "SABCKP0"
    "hostname_frontend"   = "SAFRTP0"
    "hostname_infra"      = "SAINFP0"
    "ami-backend"         = "ami-04e5276ebb8451442"
    "ami-frontend"        = "ami-04e5276ebb8451442"
    "ami-infra"           = "ami-04ff98ccbfa41c9ad"
    "type-backend"        = "t2.micro"
    "type-frontend"       = "t2.micro"
    "type-infra"          = "t2.medium"
    "volume-backend"      = "20"
    "volume-frontend"     = "20"
    "volume-infra"        = "20"
  }
  type = map(string)
}

variable "key_pair" {
  default = {
    name            = "application"
  }
  type = map(string)
}

# DNS
variable "dns" {
  default = {
    "swarmpit_http"      = "swarmpit"
    "zone_external_name" = "application.com.br"
    "zone_internal_name" = "cloud.dns.internal"
  }
  type = map(string)
}

variable "dns_external" {
  default = ["admin", "app", "api"]
  type    = list(string)
}

# INSTANTE SWARMPIT
variable "ports_swarmpit" {
  default = {
    "http"      = "5301"
  }
  type = map(string)
}

#ECR
variable "ecr_repositories" {
  default = [
    "application-middleware", "application-app"
  ]
  type = list(string)
}

# NETWORK
variable "network_config" {
  description = "Network Configuration"
  type = object({
    vpc_cidr_block      = string
    vpc_dns_name        = string
  })

  default = {
    vpc_cidr_block      = "10.0.0.0/16"
    vpc_dns_name        = "vpc_producao"
  }
}
# VPC
variable "vpc_zone_name" {
  default = ["us-east-1a", "us-east-1b"]
  type    = list(string)
}

variable "production_vpc_subnet_private_cidr_block" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
  type    = list(string)
}
variable "production_vpc_subnet_public_cidr_block" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
  type    = list(string)
}

#SECURITY-GROUPS
variable "backend_security_group" {
  description = "Configurações para o grupo de segurança da instância de backend"
  type = map(any)
  default = {
    name        = "SG-BACKEND"          # Nome do grupo de segurança para a instância de backend
    description = "Allow traffic to backend"  # Descrição do grupo de segurança para a instância de backend
  }
}

# Variáveis para os grupos de segurança da instância de frontend
variable "frontend_security_group" {
  description = "Configurações para o grupo de segurança da instância de frontend"
  type = map(any)
  default = {
    name        = "SG-FRONTEND"         # Nome do grupo de segurança para a instância de frontend
    description = "Allow traffic to frontend"  # Descrição do grupo de segurança para a instância de frontend
  }
}

# Variáveis para os grupos de segurança da instância de infra
variable "infra_security_group" {
  description = "Configurações para o grupo de segurança da instância de infra"
  type = map(any)
  default = {
    name        = "SG-INFRA"         # Nome do grupo de segurança para a instância de infra
    description = "Allow traffic to infra"  # Descrição do grupo de segurança para a instância de infra
  }
}
# Variáveis para os grupos de segurança da instância de external-load-balancer
variable "external-loadbalancer_security_group" {
  description = "Configurações para o grupo de segurança da instância de external_load_balancer"
  type = map(any)
  default = {
    name        = "SG-EXTERNAL-LOAD-BALANCER"         # Nome do grupo de segurança para a instância de external_load_balancer
    description = "Allow traffic to external_load_balancer"  # Descrição do grupo de segurança para a instância de external_load_balancer
  }
}
# PORTS
variable "ports_backend" {
  default = [
    "3000" 
  ]
  type = list(string)
}

variable "ports_frontend" {
  default = ["8081", "8000"]
  type = list(string)
}

variable "ports_infra" {
  default = ["27017", "6379", "9092", "5432"]
  type = list(string)
}

variable "ports_external-loadbalancer" {
  default = ["80", "443"]
  type = list(string)
}

# SERVICES
variable "services_backend" {
  default = [
    "application-middleware",
    "Mis-Meta-ADS"
  ]
  type = list(string)
}
variable "services_frontend" {
  default = ["Admin", "APP"]
}
variable "services_infra" {
  default = [
    "Mongo", "Postgres", "Swarmpit"
  ]
  type = list(string)
}
# ROUTE53
variable "route53" {
  default = {
    public_zone_name  = "application.com.br"
    private_zone_name = "cloud.dns.internal"
  }
  type = map(string)
}
