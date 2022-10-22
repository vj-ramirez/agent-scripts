#!/bin/bash


##Packages below will installed#

echo "Packages will now begin installing"


sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin     
sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io docker-compose-plugin

sudo systemctl start docker
sudo docker run hello-world


######Commands below will configure apache server#####

yum install httpd -y
systemctl start httpd
systemctl status httpd
systemctl enable httpd
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
iptables-save | grep 80

# The directory for modifying apache is /var/www/html