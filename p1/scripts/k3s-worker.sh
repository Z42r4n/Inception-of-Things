#!/bin/bash
set -e

echo "[+] Installing K3s (agent)..."

# Wait for token and IP to appear
while [ ! -f /vagrant/k3s/node-token ]; do
    echo "Waiting for master to be ready..."
    sleep 5
done

# Read server info
SERVER_IP="192.168.56.110"
TOKEN=$(cat /vagrant/k3s/node-token)

# Install K3s agent
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent" K3S_URL="https://$SERVER_IP:6443" K3S_TOKEN="$TOKEN" sh -s -
curl -sfL https://get.k3s.io | K3S_URL="https://$SERVER_IP:6443" K3S_TOKEN="$TOKEN" sh -s - agent --flannel-iface eth1

echo "[+] K3s agent installed and joined cluster."
