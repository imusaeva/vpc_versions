resource "aws_security_group" "sg_instance" {
  name        = "${var.env}-instance-sg"
  description = "SG for my dev instance"
  vpc_id      = aws_vpc.main.id
}
resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance.id
}
resource "aws_security_group_rule" "ingress_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" //all protocols all ports
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance.id
}