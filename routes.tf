#Criação de uma rota para a Internet através do gateway NAT
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.production.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.production_gateway.id
  }

  tags = {
    Name = "public-route-table"
  }
}
# Associação da subnet pública à tabela de rotas pública
resource "aws_route_table_association" "public_route_association" {
  count          = length(var.vpc_zone_name)
  subnet_id      = aws_subnet.public_subnet["${count.index}"].id
  route_table_id = aws_route_table.public_route_table.id
}

# Criação de uma rota para acesso à Internet para a subnet privada através do gateway NAT
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.production.id

  tags = {
    Name = "private-route-table"
  }
}

# Associação da subnet privada à tabela de rotas privada
resource "aws_route_table_association" "private_route_association" {
  count          = length(var.vpc_zone_name)
  subnet_id      = aws_subnet.private_subnet["${count.index}"].id
  route_table_id = aws_route_table.private_route_table.id
}