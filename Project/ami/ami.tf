resource "aws_ami_from_instance" "zjaminew" {
  name               = "zjaminew"
  source_instance_id = var.ec2_id
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_instance" "zjaminewec2" {
  ami           = aws_ami_from_instance.zjaminew.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnets.default.ids[0]
  key_name      = var.key_name

  tags = {
    Name = "zjaminewec2"
  }
}
