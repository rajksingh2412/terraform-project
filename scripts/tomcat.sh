#!/bin/bash

# sleep until instance is ready
# until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
#   sleep 1
# done

sudo apt update
sudo apt install default-jdk
java -version
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
wget -c https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.zip
sudo apache-tomcat-9.0.70.zip -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.34 /opt/tomcat/updated
sudo chown -R tomcat: /opt/tomcat/*
sudo sh -c 'chmod +x /opt/tomcat/updated/bin/*.sh'
sudo nano /etc/systemd/system/tomcat.service
echo -e " 
cp tomcat_config /etc/systemd/system/tomcat.service


sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
sudo ufw allow 8080/tcp