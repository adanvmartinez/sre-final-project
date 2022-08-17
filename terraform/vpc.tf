

#Create VPC
resource "aws_vpc" "adan-terraform-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    "Name" = "adan-terraform-vpc"
  }
  
}