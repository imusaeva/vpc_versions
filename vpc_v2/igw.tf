resource "aws_internet_gateway" "internet_gatway" {
  vpc_id = aws_vpc.vpc_v2.id
  tags = {
    Name = "${var.env}-internet_gateway"
  }
}
