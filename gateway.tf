data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_internet_gateway" "production_gateway" {
  vpc_id = aws_vpc.production.id
  tags = {
    Name = "production_internet_gateway"
  }
}
