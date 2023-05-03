apt-get update
apt-get install nmap -y
nmap-kube () 
{ 
    nmap --open -T4 -A -v -Pn -p 80,443,2379,8080,9090,9100,9093,4001,6782-6784,6443,8443,9099,10250,10255,10256 "${@}"
}

nmap-kube-discover () {
    local LOCAL_RANGE=$(ip a | awk '/eth0$/{print $2}' | sed 's,[0-9][0-9]*/.*,*,');                                                                  
    local SERVER_RANGES=" ";
    SERVER_RANGES+="10.0.0.1 ";
    SERVER_RANGES+="10.0.1.* ";
    SERVER_RANGES+="10.*.0-1.* ";
    nmap-kube ${SERVER_RANGES} "${LOCAL_RANGE}"
}
nmap-kube-discover
