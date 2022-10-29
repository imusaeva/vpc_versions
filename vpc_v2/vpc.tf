resource "aws_vpc" "vpc_v2" {
  cidr_block = var.cidr_block_vpc_v2
  tags = {
    Name = "${var.env}-vpc_v2"
  }
}