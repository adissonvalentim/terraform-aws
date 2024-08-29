data "aws_vpc" "default" {
  default = true
}

resource "aws_vpc" "production" {
  cidr_block           = var.network_config["vpc_cidr_block"]
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.network_config["vpc_dns_name"]
  }
}
