resource "aws_security_group" "sg_launch_conf" {
  name        = "${var.env}-launch_conf_sg"
  description = "This sg is for launch_conf"
  count       = length(var.ingress_rule)

  ingress {

    description = "this is for ingress rule"
    from_port   = element(var.ingress_rule, count.index)
    to_port     = element(var.ingress_rule, count.index)
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block_sg]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "launch_conf"
  }
}