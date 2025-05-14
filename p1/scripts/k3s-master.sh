#!/bin/bash
set -e

echo "[+] Installing K3s (server)..."

# Install K3s master
curl -sfL https://get.k3s.io | sh -s - server --flannel-iface eth1 --write-kubeconfig-mode 644

# Save the token
mkdir -p /vagrant_data/k3s
cp /var/lib/rancher/k3s/server/node-token /vagrant_data/k3s/

echo "[+] K3s master installed."
