#!/bin/bash

# Install ngrok using Snap
sudo snap install ngrok

# Authenticate with ngrok using the provided token
sudo ngrok authtoken 2jjqJ8mTlps4zo2wDNnREY5Xups_5BJT4C1zFSDQcyGQYqg1b

# Create TCP tunnel for port 22
#ngrok tcp 22 &

# Create TCP tunnel for port 3389
sudo ngrok tcp 3389 &

echo "ngrok installed and tunnels created successfully."
