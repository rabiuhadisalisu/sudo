#!/bin/bash

# Download ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -O ngrok.tgz

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "ngrok downloaded successfully."
else
    echo "Failed to download ngrok. Exiting."
    exit 1
fi

# Extract ngrok
sudo tar -xvzf ngrok.tgz -C /usr/local/bin

# Run the following command to add your authtoken to the default ngrok.yml configuration file.
ngrok authtoken 2Hd7yeF4INCKbg2aP9rGMLnDqBX_5K7WhATjW8eUxS6UoHSRa

# Run ngrok tcp 22 with nohup
nohup ngrok tcp 22 &> ngrok_out.txt &
ngeok ngrok http --domain=readily-touching-teal.ngrok-free.app 80 &

# Extract endpoint URL from nohup out file and echo
endpoint_url=$(grep -o "tcp://[0-9a-z\.]*:[0-9]*" ngrok_out.txt)
echo "Endpoint URL: $endpoint_url"
