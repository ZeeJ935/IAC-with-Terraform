resource "tls_private_key" "zjrsanew" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "zjkeypairnew" {
  key_name   = "zjkeypairnew"
  public_key = tls_private_key.zjrsanew.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.zjrsanew.private_key_pem
  filename = "C:/Users/GNG/Downloads/zjkeypairnew.pem"
}