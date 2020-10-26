echo "Please input local IP: "
read -r localip
echo "Please input remote IP: "
read -r remoteip
echo "Please input tunnel IP: "
read -r tunip
echo "Please input dev name: "
read -r devname
echo "Now running: sudo ip tunnel add $tunip mode gre local $localip remote $remoteip ttl 255"
sudo ip tunnel add $tunip mode gre local $localip remote $remoteip ttl 255
sleep 2
echo "Now running: sudo ip addr add $tunip/30 dev $devname"
sudo ip addr add $tunip/30 dev $devname
sleep 2
echo "Now running: sudo ip link set $devname up"
sudo ip link set $devname up
sleep 2
echo "Script is now finished"

