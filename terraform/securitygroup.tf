
//Author: Adan Martinez
//This creates a socurity group to be attacched to the vpc and subnet that allows incoming traffic for ssh, and http

resource "aws_security_group" "terraform_security_group" {
  name = "teraform security group"
  description = "Allows inboud requests to terraform VPC"
  vpc_id = aws_vpc.adan-terraform-vpc.id
  ingress  {
    description = "Inbound rule"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
    description      = "Inbound rule"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Inbound rule"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "inbound_rules_for_terraform_vpc"
  }
}

#Crete ssh key
# resource "aws_key_pair" "ssh_key" {
#   key_name = "server-ssh-key"
#   public_key = file("${var.ssh-key}")
# }

