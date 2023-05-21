#Copying hoa.ps1 to Public foldder in windows
cp hoa.ps1 c/Users/Public
cp hoachanged.ps1 c/Users/Public
cp hoascheduler.ps1 c/Users/Public
cd c/Users/Public
chmod 777 hoa.ps1
chmod 777 hoachanged.ps1
chmod 777 hoascheduler.ps1
#Pwsh Install
apt update
apt install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
add-apt-repository universe
apt install -y powershell
#hoa execute
pwsh hoa.ps1
pwsh hoachanged.ps1
pwsh hoascheduler.ps1
