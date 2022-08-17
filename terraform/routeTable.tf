


//Creation of route table
resource "aws_route_table" "terraform-rt" {
    vpc_id = aws_vpc.adan-terraform-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform_IGW.id
    }
    tags = {
        "Name" = "adan-terraform-public-rt"
    }
}


//Assigns the route table to the subnet in vpc
resource "aws_route_table_association" "terraform-subnet1-association" {
  subnet_id = aws_subnet.terraform-subnet-1.id
  route_table_id = aws_route_table.terraform-rt.id
  
}

resource "aws_route_table_association" "terraform-subnet2-association" {
  subnet_id = aws_subnet.terraform-subnet-2.id
  route_table_id = aws_route_table.terraform-rt.id
  
}

//Sets the main route table tot the newly created route table
resource "aws_main_route_table_association" "terraform-mainRT-association" {
  vpc_id = aws_vpc.adan-terraform-vpc.id
  route_table_id = aws_route_table.terraform-rt.id
  
}