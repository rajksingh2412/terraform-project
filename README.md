# terraform-vpc
Terraform IAC! 

It creates; 
* 1 VPC, 
* 1 public subnet, 
* 1 Internet Gateway, 
* 1 Security Group
* 3 EC2 

Prerequiste :
- Add the keys for the aws command 
- install terraform

After cloning the repo, just run these 3 commands

```
ssh-keygen -f key-pair
terraform init
terraform plan 
terraform apply

