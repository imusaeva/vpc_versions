resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-igw"
  }
}
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-pub-rt"
  }
}
resource "aws_route_table" "priv-route-table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-priv-rt"
  }
}
resource "aws_route" "internet-route" {
  route_table_id         = aws_route_table.pub-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet.id

}
resource "aws_route_table_association" "rt_pubsub-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.pub-route-table.id
}
resource "aws_route_table_association" "rt_pubsub-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.pub-route-table.id
}
resource "aws_route_table_association" "rt_pubsub-3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.pub-route-table.id
}
resource "aws_route_table_association" "rt_privsub-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.priv-route-table.id
}
resource "aws_route_table_association" "rt_privsub-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.priv-route-table.id
}
resource "aws_route_table_association" "rt_privsub-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.priv-route-table.id
}
resource "aws_route" "nat-route" {
  route_table_id         = aws_route_table.priv-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}