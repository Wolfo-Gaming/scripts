echo "IP: xxx.xxx.xxx.xxx : "
read -r address
cat <<EOT >> cnf.tmp 
network:
  ethernets:
    enp0s3:
      addresses: [$address/24]
      gateway4: 192.168.2.254
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
  version: 2
EOT
cp cnf.tmp /etc/netplan/00-installer-config.yaml
