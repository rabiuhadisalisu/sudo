#!/bin/bash

# Update package list
sudo apt update

# Install WireGuard
sudo apt install -y wireguard

# Generate server keys
echo "Generating server keys..."
umask 077
wg genkey | tee server_private_key | wg pubkey > server_public_key

# Create WireGuard configuration file
sudo tee /etc/wireguard/wg0.conf > /dev/null <<EOF
[Interface]
Address = 10.0.0.1/24
PrivateKey = $(cat server_private_key)
ListenPort = 51820
ListenAddress = 0.0.0.0

EOF

# Enable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Enable WireGuard service
sudo systemctl enable --now wg-quick@wg0

# Print server configuration
echo "WireGuard server configuration:"
cat /etc/wireguard/wg0.conf

echo "WireGuard server installation and configuration completed."
