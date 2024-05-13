#!/bin/bash

# Step 1: Download Localtonet
echo "Downloading Localtonet..."
wget https://localtonet.com/download/localtonet-linux-x64.zip

# Step 2: Extract the downloaded file
echo "Extracting Localtonet..."
unzip localtonet-linux-x64.zip

# Step 3: Grant permissions
echo "Granting permissions to Localtonet executable..."
chmod 777 ./localtonet

# Step 4: Set up Localtonet with authentication token
echo "Setting up Localtonet with authentication token..."
nohup ./localtonet authtoken AzqKXOBuEPJGhadsN2vF9HjfDikntxUWL &> ngrok_out.txt &

echo "Localtonet setup completed."
