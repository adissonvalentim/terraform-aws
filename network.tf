# Criação da subnet publica
resource "aws_subnet" "public_subnet" {
  count                   = length(var.production_vpc_subnet_public_cidr_block)
  vpc_id                  = aws_vpc.production.id
  cidr_block              = var.production_vpc_subnet_public_cidr_block["${count.index}"]
  availability_zone       = var.vpc_zone_name["${count.index}"]
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-${var.vpc_zone_name["${count.index}"]}"
  }
}

# Criação da subnet privada
resource "aws_subnet" "private_subnet" {
  count             = length(var.production_vpc_subnet_private_cidr_block)
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.production_vpc_subnet_private_cidr_block["${count.index}"]
  availability_zone = var.vpc_zone_name["${count.index}"]
  map_public_ip_on_launch = false
  tags = {
    "Name"   = "private-${var.vpc_zone_name["${count.index}"]}"
  }
}

# Elastic IP para instância de backend
resource "aws_eip" "backend_eip" {
  instance = aws_instance.backend_instance[0].id
  vpc      = true
}

# Elastic IP para instância de frontend
resource "aws_eip" "frontend_eip" {
  instance = aws_instance.frontend_instance[0].id
  vpc      = true
}

# Elastic IP para instância de infra
resource "aws_eip" "infra_eip" {
  instance = aws_instance.infra_instance[0].id
  vpc      = true
}

