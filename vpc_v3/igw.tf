resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = replace(local.name, "rtype", "igw")
  }
}

resource "aws_eip" "NatEIP" {
  vpc        = true
  depends_on = [aws_internet_gateway.dev_igw]
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.NatEIP.id
  subnet_id     = aws_subnet.public_subnet[0].id
}

######### Route table for Public Subnet ###########
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
}

########## Route table for Private Subnets ################
resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
}