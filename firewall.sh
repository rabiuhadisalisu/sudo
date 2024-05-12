#!/bin/bash

# Disable UFW (Uncomplicated Firewall)
echo "Disabling UFW..."
sudo ufw disable

# Stop and disable iptables
echo "Stopping iptables service..."
sudo systemctl stop iptables

echo "Disabling iptables service..."
sudo systemctl disable iptables

# Stop and disable firewalld
echo "Stopping firewalld service..."
sudo systemctl stop firewalld

echo "Disabling firewalld service..."
sudo systemctl disable firewalld

echo "All firewalls have been disabled."
