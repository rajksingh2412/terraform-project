resource "aws_vpc" "prod-vpc" {
    cidr_block = var.VPC_CIDR
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    #enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = var.VPC_NAME

    }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = var.SUBNET_CIDR
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "ap-south-1a"

    tags = {
        Name = "prod-subnet-public-1"
    }
}
