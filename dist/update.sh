#!/bin/bash

# Update package lists
sudo apt-get update -y

# Upgrade installed packages
sudo apt-get upgrade -y

# Remove unnecessary packages
sudo apt-get autoremove -y

# Clean up cached packages
sudo apt-get clean

echo "Package update and upgrade completed Successfuly."
