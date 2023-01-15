#!/bin/bash


# install nginx
sudo mkdir  /home/ubuntu/raj

{if ${name} eq "nginx" }

    apt-get update
    apt-get -y install nginx
    echo " Hello !!! From nginx and Terraform" > /var/www/html/index.html
    # make sure nginx is started
    service nginx start

{elseif ${name} eq "postgres" }
    sudo apt update -y
    sudo apt install postgresql postgresql-contrib -y
    sudo systemctl start postgresql.service

{else}
 echo  "NOhtins"

{/if}