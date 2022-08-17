

#create a aws_instance

# resource "aws_instance" "terraform-lab-instance" {
#     ami = data.aws_ami.amazon-linux.id
#     instance_type = "t2.micro"
#     vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
#     subnet_id = aws_subnet.terraform-lab-subnet.id
#     associate_public_ip_address = true
#     availability_zone = "us-west-1a"

#     tags = {
#         "Name" = "terrafrom-lab-instance"
#     }
# }