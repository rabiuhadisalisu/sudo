#!/bin/bash

# Install ngrok using Snap
sudo snap install ngrok

# Authenticate with ngrok using the provided token
sudo ngrok authtoken 2Hd7yeF4INCKbg2aP9rGMLnDqBX_5K7WhATjW8eUxS6UoHSRa

# Create TCP tunnel for port 22
#ngrok tcp 22 &

# Create TCP tunnel for port 3389
sudo ngrok tcp 3389 &

echo "ngrok installed and tunnels created successfully."
