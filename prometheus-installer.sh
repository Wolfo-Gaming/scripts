useradd -m -s /bin/bash prometheus
su - prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.13.1/prometheus-2.13.1.linux-amd64.tar.gz
tar -xf prometheus-2.13.1.linux-amd64.tar.gz
mv prometheus-2.13.1.linux-amd64/ prometheus/
mkdir -p ~/prometheus/data
cat <<EOT >> /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Server
Documentation=https://prometheus.io/docs/introduction/overview/
After=network-online.target

[Service]
User=prometheus
Restart=on-failure

#Change this line if you download the 
#Prometheus on different path user
ExecStart=/home/prometheus/prometheus/prometheus \
  --config.file=/home/prometheus/prometheus/prometheus.yml \
  --storage.tsdb.path=/home/prometheus/prometheus/data

[Install]
WantedBy=multi-user.target
EOT
systemctl daemon-reload
systemctl start prometheus
systemctl enable prometheus
systemctl status prometheus
ufw disable
