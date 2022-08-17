# # Create Internet Gateway
resource "aws_internet_gateway" "terraform_IGW" {
  vpc_id = aws_vpc.adan-terraform-vpc.id #Use the ID from the vpc creted in the first step
  tags = {
    "Name" = "adan-terraform-IGW"
  }
  
}
