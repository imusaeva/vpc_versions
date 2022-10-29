locals {
  name = "aws-${var.region}-${var.env}-${var.stage}-${var.project}-rtype"
  common_tags = {
    Team        = "DevOps"
    Owner       = "Irina"
    Environment = var.env
    Project     = var.project
  }
}