variable "VPC_CIDR" {
  default = "10.100.0.0/16"
}

variable "SUBNET_CIDR" {
  default = "10.100.1.0/24"
}

variable "VPC_NAME" {
  default = "chalo-prod-vpc"
}

variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "SCRIPT_NAME" {
  default = ["nginx.sh","postgres.sh"]
}

variable "INSTANCE_COUNT" {
  default = 2
}

variable "INSTANCE_NAME" {
  default = ["nginx" ,"postgres"]
}

variable "PRIVATE_KEY_PATH" {
  default = "key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
variable "AMI" {
  type = map

  default ={
    ap-south-1 = "ami-0f69bc5520884278e"
  }
}
