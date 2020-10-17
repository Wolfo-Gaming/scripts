sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update -y
sudo apt-get install grafana -y
ufw disable
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
