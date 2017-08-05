set -x

mkdir -p /tmp/consul
cd /tmp/consul

# Consul Configuration File
tee consul.json <<CONSULCONFIG
{
    "bootstrap_expect": 3,
    "client_addr": "0.0.0.0",
    "data_dir": "/var/lib/consul",
    "datacenter": "mustach-project",
    "enable_syslog": true,
    "log_level": "INFO",
    "server": true,
    "ui_dir": "/opt/consul-ui"
}
CONSULCONFIG

# Consul Upstart Script
tee consul.upstart.conf <<CONSULUPSTART
# /etc/inid/consul.conf
exec consul agent -config-dir /etc/consul
CONSULUPSTART

# Download things
wget -q -nc https://releases.hashicorp.com/consul/0.9.0/consul_0.9.0_linux_amd64.zip
wget -q -nc https://github.com/fboukezzoula/PlaceholdersKit/docker-full-examples/consul/0.9.0_web_ui.zip

# Update
apt-get update -qq
apt-get install -y unzip

# Install everything
unzip -o consul_0.9.0_linux_amd64.zip
unzip -o 0.9.0_web_ui.zip
stop consul || true
cp consul /usr/local/bin/consul
mkdir -p /opt/consul-ui
cp -R dist/* /opt/consul-ui
mkdir -p /etc/consul
mkdir -p /var/lib/consul
cp consul.json /etc/consul/consul.json
cp consul.upstart.conf /etc/init/consul.conf
restart consul || start consul
