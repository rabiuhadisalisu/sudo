#!/bin/bash

# Install GNOME
sudo apt-get update -y
sudo apt-get install gnome-shell ubuntu-gnome-desktop -y

# Ensure gdm3 (GNOME Display Manager) is installed
sudo apt-get install gdm3 -y

# Set gdm3 as the default display manager
sudo dpkg-reconfigure gdm3

# Use `sudo service` to start or restart the gdm3 service
sudo service gdm3 start

echo "GNOME installation completed without prompts."
