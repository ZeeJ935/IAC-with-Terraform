resource "aws_instance" "zjec2new1" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[0]
  key_name       = var.key_name
  vpc_security_group_ids = var.security_group_ids
  tags = {
    Name = "zj-ec2-instance-new1"
  }
}

resource "aws_instance" "zjec2new2" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[1]
  key_name       = var.key_name
  vpc_security_group_ids = var.security_group_ids
  tags = {
    Name = "zj-ec2-instance-new2"
  }
}