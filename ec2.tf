resource "aws_instance" "web-server" {

    #count = var.INSTANCE_COUNT
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
  #  name = var.INSTANCE_NAME[count.index]
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.key-pair.id}"
    user_data = "${file("scripts/nginx.sh")}"
   


    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
    tags = {
         Name = "nginx"
	}
}



resource "aws_instance" "postgres" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.key-pair.id}"

    user_data = "${file("scripts/postgres.sh")}"

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
    tags = {
         Name = "postgres"
	}
}


resource "aws_instance" "tomcat" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.key-pair.id}"

    user_data = "${file("scripts/tomcat.sh")}"

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
    tags = {
         Name = "tomcat"
	}
}

resource "aws_key_pair" "key-pair" {
    key_name = "key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
