# Instância de backend
resource "aws_instance" "backend_instance" {
  count                = 1
  ami                  = var.instance["ami-backend"]
  instance_type        = var.instance["type-backend"]
  key_name             = aws_key_pair.key_pair.id
  subnet_id            = aws_subnet.public_subnet[count.index].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.backend_security_group.id]  

  root_block_device {
    encrypted   = true
    volume_size = var.instance["volume-backend"]
    volume_type = "gp3"
    tags = {
      Name = "${var.instance["hostname_backend"]}${count.index + 1}"
    }
  }

  tags = {
    Name ="${var.instance["hostname_backend"]}${count.index + 1}"
  }
}

# Instância de frontend
resource "aws_instance" "frontend_instance" {
  count                = 1
  ami                  = var.instance["ami-frontend"]
  instance_type        = var.instance["type-frontend"]
  key_name             = aws_key_pair.key_pair.id
  subnet_id            = aws_subnet.public_subnet[count.index].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.frontend_security_group.id]  

  root_block_device {
    encrypted   = true
    volume_size = var.instance["volume-frontend"]
    volume_type = "gp3"
    tags = {
      Name = "${var.instance["hostname_frontend"]}${count.index + 1}"
    }
  }

  tags = {
    Name ="${var.instance["hostname_frontend"]}${count.index + 1}"
  }
}

# Instância de infra
resource "aws_instance" "infra_instance" {
  count                = 1
  ami                  = var.instance["ami-infra"]
  instance_type        = var.instance["type-infra"]
  key_name             = aws_key_pair.key_pair.id
  subnet_id            = aws_subnet.public_subnet[count.index].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.infra_security_group.id]  

  root_block_device {
    encrypted   = true
    volume_size = var.instance["volume-infra"]
    volume_type = "gp3"
    tags = {
      Name = "${var.instance["hostname_infra"]}${count.index + 1}"
    }
  }

  tags = {
    Name ="${var.instance["hostname_infra"]}${count.index + 1}"
  }
}

