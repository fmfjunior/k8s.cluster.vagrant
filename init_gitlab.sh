#!/bin/bash

#Instalando SSH
echo "[TASK 1] Instalando SSH"
sudo yum install -y curl policycoreutils-python openssh-server > /dev/null 2>&1
sudo systemctl enable sshd  
sudo systemctl start sshd 

#Desabilitando o Firewall
echo "[TASK 2] Desabilitando o Firewall"
sudo firewall-cmd --permanent --add-service=http 
sudo firewall-cmd --permanent --add-service=https 
sudo systemctl reload firewalld 

#Instalando GitLab CE
echo "[TASK 3] instalando GitLab CE"
sudo yum install postfix > /dev/null 2>&1
sudo systemctl enable postfix > /dev/null 2>&1
sudo systemctl start postfix > /dev/null 2>&1 
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash > /dev/null 2>&1
sudo EXTERNAL_URL="http://gitlab.example.com" yum install -y gitlab-ce > /dev/null 2>&1
sudo gitlab-ctl reconfigure > /dev/null 2>&1
