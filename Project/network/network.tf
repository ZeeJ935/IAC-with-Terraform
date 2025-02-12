resource "aws_vpc" "zjvpcnew" {
  cidr_block = "172.19.0.0/16"

  tags = {
    Name = "zj-vpc-new"
  }
}

resource "aws_subnet" "zjsubnetnew" {
  vpc_id     = aws_vpc.zjvpcnew.id
  cidr_block = "172.19.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "zjsubnetnew2" {
  vpc_id     = aws_vpc.zjvpcnew.id
  cidr_block = "172.19.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "zjigwnew" {
  vpc_id = aws_vpc.zjvpcnew.id
}

resource "aws_route_table" "zjroutetablenew" {
  vpc_id     = aws_vpc.zjvpcnew.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zjigwnew.id
  }
}

resource "aws_route_table_association" "zjroutetableassociationnew" {
  subnet_id      = aws_subnet.zjsubnetnew.id
  route_table_id = aws_route_table.zjroutetablenew.id
}
