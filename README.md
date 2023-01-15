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
terraform plan -out terraform.out
terraform apply terraform.out
```![terraform-arch](https://user-images.githubusercontent.com/43915031/212563525-4cb60ea0-a0da-43cb-8fb5-6f0547d97295.jpeg)
