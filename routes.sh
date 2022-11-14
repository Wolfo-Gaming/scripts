# wireguard port forwarding to client
sudo iptables -t nat -A PREROUTING -p tcp --dport 1:21 -j DNAT --to-destination 10.0.0.2:1-21
sudo iptables -t nat -A PREROUTING -p tcp --dport 23:52051 -j DNAT --to-destination 10.0.0.2:23-52051
sudo iptables -t nat -A PREROUTING -p tcp --dport 52053:65535 -j DNAT --to-destination 10.0.0.2:52053-65535
sudo iptables -t nat -A PREROUTING -p udp --dport 1:21 -j DNAT --to-destination 10.0.0.2:1-21
sudo iptables -t nat -A PREROUTING -p udp --dport 23:52051 -j DNAT --to-destination 10.0.0.2:23-52051
sudo iptables -t nat -A PREROUTING -p udp --dport 52053:65535 -j DNAT --to-destination 10.0.0.2:52053-65535
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
