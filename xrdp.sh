#!/bin/bash

# Update package lists
sudo apt-get update -y

# Install XRDP
sudo apt-get install xrdp -y

# Adding User to xrdp Group
sudo adduser rhsalisu xrdp

# Start the XRDP service
sudo systemctl start xrdp

# Enable XRDP to start on boot
sudo update-rc.d xrdp enable

echo "XRDP installed and started successfully."
