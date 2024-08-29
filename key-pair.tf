resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair["name"]
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "key_pair" {
    content              = tls_private_key.rsa.private_key_pem
    filename             = "application.pem"
    file_permission      = "0400"
}