
//Creation of the subnet we will be working with in AWS
resource "aws_subnet" "terraform-subnet-1" {
    vpc_id = aws_vpc.adan-terraform-vpc.id
    cidr_block = "10.0.1.0/24" //CIDR block must be string
    map_public_ip_on_launch = true
    availability_zone = "us-east-2a"
    tags = {
        "Name" = "terraform-subnet-1"
    }
}

//Creating second  subnet as EKS klusters require availability in at least two Availability Zone
resource "aws_subnet" "terraform-subnet-2" {
    vpc_id = aws_vpc.adan-terraform-vpc.id
    cidr_block = "10.0.2.0/24" //CIDR block must be string
    availability_zone = "us-east-2b"
    map_public_ip_on_launch = true
    tags = {
        "Name" = "terraform-subnet-2"
    }
}

